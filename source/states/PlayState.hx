                        package states;

					    import flixel.FlxG;
						import flixel.FlxSprite;
						import flixel.FlxState;
						import flixel.text.FlxText;
						import flixel.ui.FlxButton;
						import flixel.math.FlxMath;
						import sprites.Casas;
						import sprites.Jefe;
						import sprites.Personaje;
						import sprites.Enemigo;
						import flixel.math.FlxRandom;

						class Playstate extends FlxState
						{
							private var player:Personaje;
							private var enemyArray = new Array<Enemigo>();
							private var enemigo:Enemigo;
							private var jefe:Jefe;
							private var casa1:Casas;
							private var casa2:Casas;
							private var casa3:Casas;
							private var totalenemigos:Int = 21;
							private var tiempo_1:Int = 0;
							private var tiempo_2:Int = 0;
							private var tiempo_3:Int = 0;
							private var tiempo_4:Int = 0;
							private var tiempo_5:Int = 0;
							private var balaRandom:FlxRandom = new FlxRandom();
							
							override public function create():Void
							{
								player = new Personaje(FlxG.width / 2, FlxG.height - 16);
								add(player);
								player.loadGraphic(AssetPaths.personaje__png, false, 16, 16);
								jefe = new Jefe();
								casa1 = new Casas(FlxG.width -(FlxG.width - 16), FlxG.height - 50);
								add (casa1);
								casa2 = new Casas(FlxG.width -(FlxG.width - 64), FlxG.height - 50);
								add (casa2);
								casa3 = new Casas(FlxG.width -(FlxG.width - 112), FlxG.height - 50);
								add (casa3);
				
								var f:Int = 10;
								var c:Int = 10;
								for (i in 0...totalenemigos)
								{
									enemigo = new Enemigo(f, c);
									if (f >= (FlxG.width - player.width -32))
									{
									   f = 10;
									   c += 20;
									}
									   else
									   {
										   f += 20;
									   }
									enemyArray.push(enemigo);
									add(enemyArray[i]);
							
								}
						
								super.create();
								
							}

							override public function update(elapsed:Float):Void
							{
								super.update(elapsed);
								
								//colision con bala de enemigo
								if (FlxG.overlap(Enemigo.bala, this))
									{
										this.destroy();
										explosion = new FlxSprite;
				
										Enemigo.bala.destroy();
									}
					
					//CODIGO ENEMIGOS
								for (i in 0...enemyArray.length){

									
									//colision enemigo/player
									if (FlxG.overlap(enemyArray[i], player))
									{
										player.destroy();
										enemyArray[i].destroy();
									}
									
										
									
									//cambio direccion cunado tocan bordes de pantalla
									if (Enemigo.orientacion)
									{
									   enemyArray[i].x -= Enemigo.velocidadX;
									}
									else
									{
									   enemyArray[i].x += Enemigo.velocidadX;
									}
								}
								
								//desenso de los enemigos
										tiempo_1++;     //el tiempo se incrementa 60 unidades por segundo(60 fps);
										if (tiempo_1 >= 300)		//bajan cada 5 segundos, 60*5=300
											{
												for (i in 0...enemyArray.length)
												{
													 enemyArray[i].y += 10;
												}
												tiempo_1 = 0;        //se resetea el tiempo
											}
											
											
											//disparan aleatoriamente los enemigos
											tiempo_2++;
											if (tiempo_2 == 60) //cada un intervalo de tiempo
											{
												var r:Int = balaRandom.int(0, enemyArray.length - 1);
												if (enemyArray[r].active == true)
												{
											        enemyArray[r].dispara();
												}
												tiempo_2 = 0;
											}
				//FIN CODIGO ENEMIGOS
											
				//CODIGO DE JEFE							
											//cada 10 segundos aparece jefe
											tiempo_3++;
											if (tiempo_3 == 60) 
											{
												jefe = new Jefe();
												jefe.loadGraphic(AssetPaths.zubat__png, false);
												jefe.setGraphicSize (16, 16);
												add(jefe);
											}
											
											if (!jefe.exists && tiempo_3 >= 60)//si se detruye reseteamos tiempo
											{
												
												tiempo_3 = 0;//¡¡¡igualmente no logro que respawnee!!!!
											}
										
											if (Jefe.orientacion)
									            {
									                jefe.x -= Jefe.velocidadX;
									            }
									             else
									             {
									                jefe.x += Jefe.velocidadX;
									             }
					//FIN CODIGO JEFE
											if (!player.exists)
											{
												
											}
						
											
							}

							
						}
