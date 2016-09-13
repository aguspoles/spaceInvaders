                        package states;

					    import flixel.FlxG;
						import flixel.FlxSprite;
						import flixel.FlxState;
						import flixel.text.FlxText;
						import flixel.ui.FlxButton;
						import flixel.math.FlxMath;
						import sprites.Personaje;
						import sprites.Enemigo;
						import flixel.math.FlxRandom;

						class Playstate extends FlxState
						{
							private var player:Personaje;
							private static var enemyArray = new Array<Enemigo>();
							private static var totalenemigos:Int = 20;
							private var tiempo_1:Int = 0;
							private var tiempo_2:Int = 0;
							private var balaRandom:FlxRandom = new FlxRandom();
							
							override public function create():Void
							{
								player = new Personaje(FlxG.width / 2, FlxG.height - 16);
								add(player);
									
								var enemigo:Enemigo;
								var f:Int = 10;
								var c:Int = 10;
								for (i in 0...totalenemigos)
								{
									if (f >= (FlxG.width - player.width - 32))
									{
									   f = 10;
									   c += 20;
									   enemigo = new Enemigo(f, c);
									}
									   else
									   {
										   enemigo = new Enemigo(f, c); 
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
											    enemyArray[balaRandom.int(0, enemyArray.length - 1)].dispara();
												tiempo_2 = 0;
											}
											
							}

							
						}
