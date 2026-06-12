<%-- Copyright (c) 2012-2020, Andy Janata All rights reserved. Redistribution and use in source and binary forms, with
  or without modification, are permitted provided that the following conditions are met: * Redistributions of source
  code must retain the above copyright notice, this list of conditions and the following disclaimer. * Redistributions
  in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT
  HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE. --%>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.google.inject.Injector" %>
      <%@ page import="com.google.inject.Key" %>
        <%@ page import="com.google.inject.TypeLiteral" %>
          <%@ page import="javax.servlet.http.HttpSession" %>
            <%@ page import="net.socialgamer.cah.RequestWrapper" %>
              <%@ page import="net.socialgamer.cah.StartupUtils" %>
                <%@ page import="net.socialgamer.cah.data.GameOptions" %>
                  <%@ page import="net.socialgamer.cah.CahModule" %>
                    <%@ page import="net.socialgamer.cah.CahModule.*" %>
                      <% HttpSession hSession=request.getSession(true); RequestWrapper wrapper=new
                        RequestWrapper(request); ServletContext servletContext=pageContext.getServletContext(); Injector
                        injector=(Injector) servletContext.getAttribute(StartupUtils.INJECTOR); boolean
                        allowBlankCards=injector.getInstance(Key.get(new TypeLiteral<Boolean>(){},
                        AllowBlankCards.class));
                        %>
                        <!DOCTYPE html>
                        <html lang="pt-BR">

                        <head>
                          <meta charset="UTF-8" />
                          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                          <title>Pretend You're Xyzzy</title>
                          <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
                          <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
                          <script type="text/javascript" src="js/jquery.cookie.js"></script>
                          <script type="text/javascript" src="js/jquery.json.js"></script>
                          <script type="text/javascript" src="js/QTransform.js"></script>
                          <script type="text/javascript" src="js/jquery-ui.min.js"></script>
                          <script type="text/javascript" src="js/cah.js"></script>
                          <script type="text/javascript" src="js/cah.config.js"></script>
                          <script type="text/javascript" src="js/cah.constants.js"></script>
                          <script type="text/javascript" src="js/cah.log.js"></script>
                          <script type="text/javascript" src="js/cah.gamelist.js"></script>
                          <script type="text/javascript" src="js/cah.card.js"></script>
                          <script type="text/javascript" src="js/cah.cardset.js"></script>
                          <script type="text/javascript" src="js/cah.game.js"></script>
                          <script type="text/javascript" src="js/cah.preferences.js"></script>
                          <script type="text/javascript" src="js/cah.longpoll.js"></script>
                          <script type="text/javascript" src="js/cah.longpoll.handlers.js"></script>
                          <script type="text/javascript" src="js/cah.ajax.js"></script>
                          <script type="text/javascript" src="js/cah.ajax.builder.js"></script>
                          <script type="text/javascript" src="js/cah.ajax.handlers.js"></script>
                          <script type="text/javascript" src="js/cah.app.js"></script>
                          <link rel="stylesheet" type="text/css" href="cah.css" media="screen" />
                          <link rel="stylesheet" type="text/css" href="jquery-ui.min.css" media="screen" />
                          <jsp:include page="analytics.jsp" />
                          <style>
                            #welcome {
                              display: flex;
                              align-items: stretch;
                              min-height: 100vh;
                              padding: 0;
                              max-width: none;
                              margin: 0;
                            }

                            .welcome-hero {
                              width: 380px;
                              min-width: 320px;
                              background: linear-gradient(160deg, var(--purple-dark) 0%, var(--purple) 100%);
                              display: flex;
                              flex-direction: column;
                              align-items: center;
                              justify-content: center;
                              padding: 48px 32px;
                              gap: 20px;
                              flex-shrink: 0;
                            }

                            .welcome-hero-badge {
                              background: rgba(80, 242, 150, 0.15);
                              border: 1px solid rgba(80, 242, 150, 0.4);
                              color: var(--green);
                              font-size: 11px;
                              font-weight: 700;
                              letter-spacing: 1.5px;
                              text-transform: uppercase;
                              padding: 6px 16px;
                              border-radius: 999px;
                            }

                            .welcome-hero-title {
                              font-size: 34px;
                              font-weight: 900;
                              letter-spacing: -1px;
                              color: #fff;
                              text-align: center;
                              line-height: 1.15;
                              margin: 0;
                            }

                            .welcome-hero-title span {
                              color: var(--green);
                            }

                            .welcome-hero-sub {
                              font-size: 13px;
                              color: var(--text-light);
                              text-align: center;
                              margin: 0;
                              line-height: 1.6;
                            }

                            .welcome-hero-divider {
                              width: 40px;
                              height: 2px;
                              background: linear-gradient(90deg, var(--green), transparent);
                              border: none;
                            }

                            .welcome-content {
                              flex: 1;
                              display: flex;
                              flex-direction: column;
                              justify-content: center;
                              padding: 48px;
                              gap: 20px;
                              overflow-y: auto;
                            }

                            .welcome-card {
                              background: rgba(255, 255, 255, 0.72);
                              backdrop-filter: blur(12px);
                              border: 1px solid rgba(255, 255, 255, 0.3);
                              border-radius: 16px;
                              padding: 24px;
                              box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
                              max-width: 580px;
                            }

                            .welcome-card h2 {
                              font-size: 20px;
                              font-weight: 800;
                              color: var(--purple);
                              margin: 0 0 6px;
                            }

                            .welcome-card h3 {
                              font-size: 14px;
                              font-weight: 500;
                              color: var(--text-secondary);
                              margin: 0 0 20px;
                            }

                            .welcome-card p {
                              font-size: 13px;
                              color: var(--text-secondary);
                              line-height: 1.6;
                              margin: 0 0 12px;
                            }

                            .welcome-card p:last-child {
                              margin-bottom: 0;
                            }

                            .welcome-card a {
                              color: var(--purple-light);
                              font-weight: 600;
                              text-decoration: none;
                              border-bottom: 1px solid rgba(74, 66, 128, 0.3);
                            }

                            #nickbox {
                              background: rgba(255, 255, 255, 0.5) !important;
                              backdrop-filter: blur(10px) !important;
                              border: 1px solid rgba(255, 255, 255, 0.35) !important;
                              border-radius: 16px !important;
                              padding: 20px !important;
                              margin-top: 0 !important;
                              display: flex !important;
                              flex-direction: row !important;
                              flex-wrap: wrap !important;
                              gap: 10px !important;
                              align-items: center !important;
                            }

                            #nickbox label {
                              font-size: 13px;
                              font-weight: 700;
                              color: var(--purple-light);
                              text-transform: uppercase;
                              letter-spacing: 0.5px;
                            }

                            #nickbox input[type="text"],
                            #nickbox input[type="password"] {
                              padding: 10px 14px !important;
                              border-radius: 10px !important;
                              border: 1px solid rgba(74, 66, 128, 0.25) !important;
                              background: #fff !important;
                              font-size: 14px !important;
                              flex: 1;
                              min-width: 140px;
                            }

                            #nicknameconfirm {
                              padding: 10px 22px !important;
                              background: linear-gradient(135deg, var(--green) 0%, var(--green-dark) 100%) !important;
                              color: var(--purple-dark) !important;
                              font-weight: 700 !important;
                              border: none !important;
                              border-radius: 999px !important;
                              cursor: pointer !important;
                              box-shadow: 0 0 18px var(--green-glow) !important;
                              transition: transform 0.2s !important;
                            }

                            #nicknameconfirm:hover {
                              transform: translateY(-2px) !important;
                            }

                            #nicknameconfirm:active {
                              transform: scale(0.96) !important;
                            }

                            #menubar input[type="button"] {
                              background: rgba(255, 255, 255, 0.15);
                              color: #fff;
                              border: 1px solid rgba(255, 255, 255, 0.25);
                              padding: 6px 14px;
                              border-radius: 999px;
                              font-size: 13px;
                              font-weight: 600;
                              cursor: pointer;
                              transition: background 0.2s;
                            }

                            #menubar input[type="button"]:hover {
                              background: rgba(255, 255, 255, 0.25);
                            }

                            #logout {
                              background: rgba(80, 242, 150, 0.2) !important;
                              border-color: rgba(80, 242, 150, 0.4) !important;
                              color: var(--green) !important;
                            }

                            .confirm_card {
                              background: linear-gradient(135deg, var(--green) 0%, var(--green-dark) 100%);
                              color: var(--purple-dark);
                              border: none;
                              padding: 10px 20px;
                              border-radius: 999px;
                              font-weight: 700;
                              cursor: pointer;
                              box-shadow: 0 0 14px var(--green-glow);
                              transition: transform 0.2s;
                            }

                            .confirm_card:hover {
                              transform: translateY(-2px);
                            }

                            .confirm_card:active {
                              transform: scale(0.96);
                            }

                            .previous_round {
                              background: var(--surface-glass);
                              backdrop-filter: blur(20px);
                              border: 1px solid var(--glass-border-strong);
                              border-radius: var(--radius-lg);
                              box-shadow: 0 24px 48px rgba(0, 0, 0, 0.2);
                            }

                            .previous_round_close {
                              background: var(--purple);
                              color: #fff;
                              border: none;
                              border-radius: var(--radius-md);
                              padding: 6px 14px;
                              cursor: pointer;
                              font-weight: 600;
                            }

                            .game_white_cards_binder {
                              border: 2px solid var(--purple-light);
                              border-radius: var(--radius-md);
                              background: rgba(74, 66, 128, 0.05);
                            }
                          </style>
                        </head>

                        <body id="gamebody">

                          <div id="welcome">
                            <aside class="welcome-hero">
                              <div class="welcome-hero-badge">Cards Against Humanity</div>
                              <h1 class="welcome-hero-title">Pretend<br>You're <span>Xyzzy</span></h1>
                              <p class="welcome-hero-sub">Configure seu apelido e entre na partida.<br>Bom jogo!</p>
                              <hr class="welcome-hero-divider" />
                              <p
                                style="color:var(--text-light);font-size:12px;text-align:center;margin:0;line-height:1.7;">
                                Seu IP é registrado ao conectar.<br>Os resultados de jogo são anônimos.
                              </p>
                            </aside>
                            <div class="welcome-content">
                              <div class="welcome-card">
                                <h2>Pretend You're Xyzzy</h2>
                                <h3>Um clone de <a href="http://cardsagainsthumanity.com/">Cards Against Humanity</a>
                                </h3>
                                <p>Primeira vez? Leia o <a href="index.jsp">changelog e lista de problemas
                                    conhecidos</a>.</p>
                                <p><strong>Atualização:</strong> 3 Set 2018 — Chat e cartas em branco desabilitados.
                                  <a
                                    href="https://gist.githubusercontent.com/ajanata/07ededdb584f7bb77a8c7191d3a4bbcc/raw/e76faacc19c2bb598a1a8fd94b9ebcb29c5502e0">Saiba
                                    o motivo.</a>
                                </p>
                                <p><strong style="color:var(--purple);">Servidores movimentados.</strong>
                                  <a href="https://pretendyoure.xyz/zy">Veja a lista</a> — estando no mesmo servidor que
                                  seus amigos, vocês podem jogar juntos.
                                </p>
                              </div>
                              <div id="nickbox">
                                <label for="nickname">Apelido:</label>
                                <input type="text" id="nickname" value="" maxlength="30" role="textbox"
                                  aria-label="Introduza o seu nickname." class="input-sniffer-glass" />
                                <input type="password" id="idcode" value="" maxlength="100" disabled="disabled"
                                  aria-label="Codigo de identificacao opcional." class="input-sniffer-glass" />
                                <div id="nickbox_error" class="error"></div>
                                <input type="button" id="nicknameconfirm" value="Set" disabled="disabled"
                                  class="btn-sniffer-primary" />
                                <a
                                  href="https://github.com/ajanata/PretendYoureXyzzy/wiki/Identification-Codes">(Ajuda)</a>
                              </div>
                              <p style="font-size:13px;color:var(--text-muted);">
                                <a href="privacy.html"><strong>Importante:</strong> leia nossa pagina de privacidade</a>
                                para detalhes sobre informacoes coletadas.
                              </p>
                            </div>
                          </div>

                          <div id="canvas" class="hide">
                            <div id="menubar">
                              <div id="menubar_left">
                                <input type="button" id="refresh_games" class="hide" value="Refresh Games" />
                                <input type="button" id="create_game" class="hide" value="Create Game" />
                                <input type="text" id="filter_games" class="hide" placeholder="Filter games by keyword"
                                  data-lpignore="true" />
                                <input type="button" id="leave_game" class="hide" value="Leave Game" />
                                <input type="button" id="start_game" class="hide game_menu_bar" value="Start Game" />
                                <input type="button" id="stop_game" class="hide game_menu_bar" value="Stop Game" />
                              </div>
                              <div id="menubar_right">
                                Current timer duration: <span id="current_timer">0</span> seconds
                                <input type="button" id="view_cards" value="View Cards"
                                  title="Open a new window to view all cards in the game."
                                  onclick="window.open('viewcards.jsp', 'viewcards');" />
                                <input type="button" id="logout" value="Log out" />
                              </div>
                            </div>
                            <div id="main">
                              <div id="game_list" class="hide"></div>
                              <div id="main_holder"></div>
                            </div>
                          </div>
                          <div id="bottom" class="hide">
                            <div id="info_area"></div>
                            <div id="tabs">
                              <ul>
                                <li><a href="#tab-preferences" class="tab-button">User Preferences</a></li>
                                <li><a href="#tab-gamelist-filters" class="tab-button">Game List Filters</a></li>
                                <li><a href="#tab-global" class="tab-button" id="button-global">Global Chat</a></li>
                              </ul>
                              <div id="tab-preferences">
                                <input type="button" value="Save" onclick="cah.Preferences.save();" />
                                <input type="button" value="Revert" onclick="cah.Preferences.load();" />
                                <label for="hide_connect_quit">
                                  <dfn
                                    title="Even with this unselected, you might not see these events if the server is configured to not send them.">Hide
                                    connect and quit events:</dfn>
                                </label>
                                <input type="checkbox" id="hide_connect_quit" />
                                <br />
                                <label for="ignore_list">Chat ignore list, one name per line:</label>
                                <br />
                                <textarea id="ignore_list" style="width: 200px; height: 150px"></textarea>
                                <br />
                                <label for="no_persistent_id">
                                  <dfn
                                    title="Even with this selected, your card plays for a single session will be tracked.">Opt-out
                                    of card play tracking between sessions:</dfn>
                                </label>
                                <input type="checkbox" id="no_persistent_id" />
                              </div>
                              <div id="tab-gamelist-filters">
                                You will have to click Refresh Games after saving any changes here.
                                <div style="text-align: right; width:100%">
                                  <input type="button" value="Save" onclick="cah.Preferences.save();" />
                                  <input type="button" value="Revert" onclick="cah.Preferences.load();" />
                                </div>
                                <fieldset>
                                  <legend>Card set filters</legend>
                                  <div class="cardset_filter_list">
                                    <span
                                      title="Any game which uses at least one of these card sets will not be shown in the game list.">Do
                                      not show any games with these card sets:</span>
                                    <select id="cardsets_banned" multiple="multiple"></select>
                                    <div class="buttons"><input type="button" id="banned_remove" value="Remove --&gt;"
                                        onclick="cah.Preferences.transferCardSets('banned', 'neutral')" /></div>
                                  </div>
                                  <div class="cardset_filter_list">
                                    <span>Do not require or ban these card sets:</span>
                                    <select id="cardsets_neutral" multiple="multiple"></select>
                                    <div class="buttons">
                                      <input type="button" id="banned_add" value="&lt;-- Ban"
                                        onclick="cah.Preferences.transferCardSets('neutral', 'banned')" />
                                      <input type="button" id="required_add" value="Require --&gt;"
                                        onclick="cah.Preferences.transferCardSets('neutral', 'required')" />
                                    </div>
                                  </div>
                                  <div class="cardset_filter_list">
                                    <span
                                      title="Any game that does not use all of these card sets will not be shown in the game list.">Only
                                      show games with these card sets:</span>
                                    <select id="cardsets_required" multiple="multiple"></select>
                                    <div class="buttons"><input type="button" id="required_remove" value="&lt;-- Remove"
                                        onclick="cah.Preferences.transferCardSets('required', 'neutral')" /></div>
                                  </div>
                                </fieldset>
                              </div>
                              <div id="tab-global">
                                <div class="log"></div>
                                <input type="text" class="chat" maxlength="200" aria-label="Type here to chat."
                                  data-lpignore="true" />
                                <input type="button" class="chat_submit" value="Chat" />
                              </div>
                            </div>
                          </div>

                          <!-- Template for game lobbies in the game list. -->
                          <div class="hide">
                            <div id="gamelist_lobby_template" class="gamelist_lobby" tabindex="0">
                              <div class="gamelist_lobby_left">
                                <h3><span class="gamelist_lobby_host">host</span>'s Game
                                  (<span class="gamelist_lobby_player_count"></span>/<span
                                    class="gamelist_lobby_max_players"></span>,
                                  <span class="gamelist_lobby_spectator_count"></span>/<span
                                    class="gamelist_lobby_max_spectators"></span>)
                                  <span class="gamelist_lobby_status">status</span>
                                </h3>
                                <div><strong>Players:</strong> <span class="gamelist_lobby_players">host, player1,
                                    player2</span></div>
                                <div><strong>Spectators:</strong> <span
                                    class="gamelist_lobby_spectators">spectator1</span></div>
                                <div><strong>Goal:</strong> <span class="gamelist_lobby_goal"></span></div>
                                <div><strong>Cards:</strong> <span class="gamelist_lobby_cardset"></span></div>
                                <div class="hide">Game <span class="gamelist_lobby_id">###</span></div>
                              </div>
                              <div class="gamelist_lobby_right">
                                <input type="button" class="gamelist_lobby_join" value="Join" />
                                <input type="button" class="gamelist_lobby_spectate" value="Spectate" />
                              </div>
                            </div>
                          </div>

                          <!-- Template for face-up black cards. -->
                          <div class="hide">
                            <div id="black_up_template" class="card blackcard">
                              <span class="card_text">The quick brown fox jumped over the lazy dog.</span>
                              <div class="logo">
                                <div class="logo_1 logo_element"></div>
                                <div class="logo_2 logo_element"></div>
                                <div class="logo_3 logo_element watermark_container"><br /><span
                                    class="watermark"></span></div>
                                <div class="logo_text">Pretend You're Xyzzy</div>
                              </div>
                              <div class="card_metadata">
                                <div class="draw hide">DRAW <div class="card_number"></div>
                                </div>
                                <div class="pick hide">PICK <div class="card_number"></div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- Template for face-down black cards. -->
                          <div class="hide">
                            <div id="black_down_template" class="card blackcard"></div>
                          </div>

                          <!-- Template for face-up white cards. -->
                          <div class="hide">
                            <div id="white_up_template" class="card whitecard">
                              <span class="card_text" role="button" tabindex="0">The quick brown fox jumped over the
                                lazy dog.</span>
                              <div class="logo">
                                <div class="logo_1 logo_element"></div>
                                <div class="logo_2 logo_element"></div>
                                <div class="logo_3 logo_element watermark_container"><br /><span
                                    class="watermark"></span></div>
                                <div class="logo_text">Pretend You're Xyzzy</div>
                              </div>
                            </div>
                          </div>

                          <!-- Template for face-down white cards. -->
                          <div class="hide">
                            <div id="white_down_template" class="card whitecard"></div>
                          </div>

                          <!-- Template for game lobbies. Holder for design. -->
                          <div style="width: 1000px; height: 506px; border: 1px solid black; position: relative;"
                            class="hide">
                            <div id="game_template" class="game">
                              <div class="game_top">
                                <input type="button" class="game_show_last_round game_menu_bar" value="Show Last Round"
                                  disabled="disabled" />
                                <input type="button" class="game_show_options game_menu_bar"
                                  value="Hide Game Options" />
                                <label class="game_menu_bar checkbox"><input type="checkbox" class="game_animate_cards"
                                    checked="checked" /><span> Animate Cards</span></label>
                                <div class="game_message" role="status">Waiting for server...</div>
                              </div>
                              <div style="width:100%; height:472px;">
                                <div class="game_main_area">
                                  <div class="game_left_side">
                                    <div class="game_black_card_wrapper">
                                      <span tabindex="0">The black card for <span
                                          class="game_black_card_round_indicator">this round is</span>:</span>
                                      <div class="game_black_card" tabindex="0"></div>
                                    </div>
                                    <input type="button" class="confirm_card btn-sniffer-primary"
                                      value="Confirm Selection" />
                                  </div>
                                  <div class="game_right_side hide">
                                    <div class="game_right_side_box game_white_card_wrapper">
                                      <span tabindex="0">The white cards played this round are:</span>
                                      <div class="game_white_cards game_right_side_cards"></div>
                                    </div>
                                    <div class="game_right_side_box game_last_round hide">
                                      The previous round was won by <span class="game_last_round_winner"></span>.
                                      <div class="game_last_round_cards game_right_side_cards"></div>
                                    </div>
                                  </div>
                                  <div class="game_options"></div>
                                </div>
                                <div class="game_hand">
                                  <div class="game_hand_filter hide"><span class="game_hand_filter_text"></span></div>
                                  <span class="your_hand" tabindex="0">Your Hand</span>
                                  <div class="game_hand_cards"></div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- Template for scoreboard container. -->
                          <div style="height: 215px; border: 1px solid black;" class="hide">
                            <div id="scoreboard_template" class="scoreboard">
                              <div class="game_message" tabindex="0">Scoreboard</div>
                            </div>
                          </div>

                          <!-- Template for scoreboard score card. -->
                          <div class="scoreboard hide" style="height: 215px;">
                            <div id="scorecard_template" class="scorecard" tabindex="0">
                              <span class="scorecard_player">PlayerName</span>
                              <div class="clear"></div>
                              <span class="scorecard_points"><span class="scorecard_score">0</span> <span
                                  class="scorecard_point_title">Awesome Point<span
                                    class="scorecard_s">s</span></span></span>
                              <span class="scorecard_status">Status</span>
                            </div>
                          </div>

                          <!-- Template for round card set binder. -->
                          <div class="hide">
                            <div id="game_white_cards_binder_template" class="game_white_cards_binder hide"></div>
                          </div>

                          <!-- Previous round display. -->
                          <div class="hide">
                            <div id="previous_round_template" class="previous_round">
                              <input type="button" class="previous_round_close" value="Close" />
                              Round winner: <span class="previous_round_winner"></span>
                              <div class="previous_round_cards"></div>
                            </div>
                          </div>

                          <!-- Template for game options. -->
                          <div class="hide">
                            <div class="game_options" id="game_options_template">
                              <span class="options_host_only">Only the game host can change options.</span>
                              <br /><br />
                              <fieldset>
                                <legend>Game options:</legend>
                                <label id="score_limit_template_label" for="score_limit_template">Score limit:</label>
                                <select id="score_limit_template" class="score_limit">
                                  <% for (int i=injector.getInstance(Key.get(Integer.class, MinScoreLimit.class)); i
                                    <=injector.getInstance(Key.get(Integer.class, MaxScoreLimit.class)); i++) { %>
                                    <option <%=(i==injector.getInstance(Key.get(Integer.class,
                                      DefaultScoreLimit.class))) ? "selected='selected' " : "" %>value="<%= i %>"><%= i
                                          %>
                                    </option>
                                    <% } %>
                                </select>
                                <br />
                                <label id="player_limit_template_label" for="player_limit_template">Player
                                  limit:</label>
                                <select id="player_limit_template" class="player_limit" aria-label="Player limit.">
                                  <% for (int i=injector.getInstance(Key.get(Integer.class, MinPlayerLimit.class)); i
                                    <=injector.getInstance(Key.get(Integer.class, MaxPlayerLimit.class)); i++) { %>
                                    <option <%=i==injector.getInstance(Key.get(Integer.class, DefaultPlayerLimit.class))
                                      ? "selected='selected' " : "" %>value="<%= i %>"><%= i %>
                                    </option>
                                    <% } %>
                                </select>
                                Having more than 10 players may get cramped!
                                <br />
                                <label id="spectator_limit_template_label" for="spectator_limit_template">Spectator
                                  limit:</label>
                                <select id="spectator_limit_template" class="spectator_limit"
                                  aria-label="Spectator limit.">
                                  <% for (int i=injector.getInstance(Key.get(Integer.class, MinSpectatorLimit.class)); i
                                    <=injector.getInstance(Key.get(Integer.class, MaxSpectatorLimit.class)); i++) { %>
                                    <option <%=i==injector.getInstance(Key.get(Integer.class,
                                      DefaultSpectatorLimit.class)) ? "selected='selected' " : "" %>value="<%= i %>"><%=
                                          i %>
                                    </option>
                                    <% } %>
                                </select>
                                Spectators can watch and chat, but not actually play. Not even as Czar.
                                <br />
                                <label id="timer_multiplier_template_label" for="timer_multiplier_template"
                                  title="Players will be skipped if they have not played within a reasonable amount of time.">Idle
                                  timer multiplier:</label>
                                <select id="timer_multiplier_template" class="timer_multiplier">
                                  <option value="0.25x">0.25x</option>
                                  <option value="0.5x">0.5x</option>
                                  <option value="0.75x">0.75x</option>
                                  <option selected="selected" value="1x">1x</option>
                                  <option value="1.25x">1.25x</option>
                                  <option value="1.5x">1.5x</option>
                                  <option value="1.75x">1.75x</option>
                                  <option value="2x">2x</option>
                                  <option value="2.5x">2.5x</option>
                                  <option value="3x">3x</option>
                                  <option value="4x">4x</option>
                                  <option value="5x">5x</option>
                                  <option value="10x">10x</option>
                                  <option value="Unlimited">Unlimited</option>
                                </select>
                                <br />
                                <fieldset class="card_sets">
                                  <legend>Card Sets</legend>
                                  <span class="base_card_sets"></span>
                                  <span class="extra_card_sets"></span>
                                </fieldset>
                                <% if (allowBlankCards) { %>
                                  <br />
                                  <label id="blanks_limit_label"
                                    title="Blank cards allow a player to type in their own answer.">
                                    Also include <select id="blanks_limit_template" class="blanks_limit">
                                      <% for (int i=injector.getInstance(Key.get(Integer.class,
                                        MinBlankCardLimit.class)); i <=injector.getInstance(Key.get(Integer.class,
                                        MaxBlankCardLimit.class)); i++) { %>
                                        <option <%=i==injector.getInstance(Key.get(Integer.class,
                                          DefaultBlankCardLimit.class)) ? "selected='selected' " : "" %>value="<%= i %>
                                            "><%= i %>
                                        </option>
                                        <% } %>
                                    </select> blank white cards.
                                  </label>
                                  <% } %>
                                    <br />
                                    <label id="game_password_template_label" for="game_password_template">Game
                                      password:</label>
                                    <input type="text" id="game_password_template"
                                      class="game_password input-sniffer-glass"
                                      aria-label="Game password. You must tab outside of the box to apply the password." />
                                    <input type="password" id="game_fake_password_template"
                                      class="game_fake_password hide" />
                                    You must click outside the box to apply the password.
                                    <input type="checkbox" id="game_hide_password_template"
                                      class="game_hide_password" />
                                    <label id="game_hide_password_template_label" for="game_hide_password_template"
                                      aria-label="Hide password from your screen."
                                      title="Hides the password from your screen, so people watching your stream can't see it.">Hide
                                      password.</label>
                              </fieldset>
                            </div>
                          </div>
                          <div style="position:absolute; left:-99999px" role="alert" id="aria-notifications"></div>
                        </body>

                        </html>