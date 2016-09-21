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
							private var explosion:FlxSprite;
							
							private var _hud:HUD;
                            private var _score:Int = 0;
                            private var _life:Int = 3;
							
							override public function create():Void
							{
						        _hud = new HUD();
                                add(_hud);
 
								player = new Personaje(FlxG.width / 2, FlxG.height - 16);
								add(player);
								jefe = new Jefe();
								casa1 = new Casas(FlxG.width - 36, FlxG.height - 50);
								add (casa1);
								casa2 = new Casas(20, FlxG.height - 50);
								add (casa2);
								casa3 = new Casas(FlxG.width/2 - 8, FlxG.height - 35);
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
								
					
					//CODIGO ENEMIGOS
								for (i in 0...enemyArray.length){

									
										//si colisionan bala y enemigo se destruyen
		                               if (FlxG.overlap(enemyArray[i], Personaje.bala))
		                               {
			                                Personaje.bala.destroy();
			                                enemyArray[i].destroy();
			                                enemyArray[i].active = false;//para q no siga disparando
	    	                                Personaje.balasEnPantalla = 0;
			                                Enemigo.cuantosMurieron++;
			                                FlxG.sound.play(AssetPaths.hit_enemigo__wav, 1, false);
			   
			                                _score += 500;
                                            _hud.updateHUD(_life, _score);
		                                }
										
										//si colisionan bala y player se destruyen
		                                  if (FlxG.overlap(player, Enemigo.bala))
		                                  {
											   FlxG.sound.play(AssetPaths.destroy__wav, 1, false);
			                                   Enemigo.bala.destroy();
			                                   _life--;
											   if (_life == 0)
											   {
												  player.destroy();
			                                      FlxG.switchState(new GameOver());
											   }
											   _hud.updateHUD(_life,_score);
		                                  }
										
									//colision enemigo/player
									if (FlxG.overlap(enemyArray[i], player))
									{
										player.destroy();
										enemyArray[i].destroy();
										FlxG.switchState(new GameOver());
									}
									
									//colision enemigos/casas
									if (FlxG.overlap(enemyArray[i], casa1))
									    casa1.destroy();
									if (FlxG.overlap(enemyArray[i], casa2))
									    casa2.destroy();
									if (FlxG.overlap(enemyArray[i], casa3))
									    casa3.destroy();
									
								    //colision entre balas
		                            if (FlxG.overlap(Enemigo.bala, Personaje.bala) && Personaje.bala != null && Enemigo.bala != null)
		                            {
			                            /*explosion = new FlxSprite(Enemigo.bala.x / 2, Enemigo.bala.y / 2);
			                            explosion.loadGraphic(AssetPaths.explosionentredisparos__png, false, 16, 16);*/
		                                Personaje.bala.destroy();
			                            Enemigo.bala.destroy();
			                            Personaje.balasEnPantalla = 0;
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
												while (!enemyArray[r].active && Enemigo.cuantosMurieron < totalenemigos)  //este ciclo me permite mantener los intervalos de tiempo, cunado vayan despareciendo los enemigos
												{
													r = balaRandom.int(0, enemyArray.length - 1);
												}
												if(enemyArray[r].active)//condicion para que no siga disparando el ultimo vivo una vez que muere
											        enemyArray[r].dispara();
												tiempo_2 = 0;
											}
				//FIN CODIGO ENEMIGOS
											
				//CODIGO DE JEFE							
											//cada 1 intervalo de tiempo aparece jefe
											tiempo_3++;
											if (tiempo_3 == 60) 
											{
												jefe = new Jefe();
												add(jefe);
											}
											
											 //si colisionan bala.player y jefe se destruyen
		                                    if (FlxG.overlap(jefe, Personaje.bala))
		                                    {
			                                    Personaje.bala.destroy();
			                                    jefe.destroy();
			                                    jefe.active = false;
	    	                                    Personaje.balasEnPantalla = 0;
			                                    _score += 1000;
												_hud.updateHUD(_life, _score);
		                                    }
											
											if (!jefe.active && tiempo_3 >= 60)//si se detruye reseteamos tiempo
											{
												
												tiempo_3 = 0;
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
						
					          //reseteamos nivel
					            if (Enemigo.cuantosMurieron == totalenemigos)
								{
								    FlxG.switchState(new Playstate());
									Enemigo.cuantosMurieron = 0;
								}

							
						}
						}
