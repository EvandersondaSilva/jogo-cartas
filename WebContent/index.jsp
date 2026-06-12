<?xml version="1.0" encoding="UTF-8" ?>
<%-- Copyright (c) 2012-2018, Andy Janata All rights reserved. Redistribution and use in source and binary forms, with
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
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Pretend You're Xyzzy — by Sniffer</title>
      <link rel="stylesheet" type="text/css" href="cah.css" media="screen" />
      <style>
        /* ── Page-level overrides for index.jsp ── */
        body {
          min-height: 100vh;
          background: var(--background-sniffer);
          display: flex;
          align-items: stretch;
        }

        .index-layout {
          display: flex;
          width: 100%;
          min-height: 100vh;
        }

        /* ── Left hero panel ── */
        .index-hero {
          width: 380px;
          min-width: 320px;
          background: linear-gradient(160deg, var(--purple-dark) 0%, var(--purple) 100%);
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          padding: 48px 32px;
          gap: 24px;
          position: sticky;
          top: 0;
          height: 100vh;
        }

        .hero-logo {
          width: 80px;
          height: auto;
          filter: drop-shadow(0 0 12px var(--green-glow));
          margin-bottom: 0px;
        }

        .brand-logo {
          width: 120px;
          height: auto;
          margin-top: -10px;
          margin-bottom: 8px;
        }

        .hero-badge {
          background: rgba(80, 242, 150, 0.15);
          border: 1px solid rgba(80, 242, 150, 0.4);
          color: var(--green);
          font-size: 12px;
          font-weight: 700;
          letter-spacing: 1.5px;
          text-transform: uppercase;
          padding: 6px 16px;
          border-radius: 999px;
        }

        .hero-title {
          font-size: 36px;
          font-weight: 900;
          letter-spacing: -1px;
          color: #fff;
          text-align: center;
          line-height: 1.15;
          margin: 0;
        }

        .hero-title span {
          color: var(--green);
        }

        .hero-subtitle {
          font-size: 15px;
          color: var(--text-light);
          text-align: center;
          margin: 0;
          line-height: 1.6;
        }

        .hero-cta {
          display: block;
          width: 100%;
          padding: 16px 24px;
          background: linear-gradient(135deg, var(--green) 0%, var(--green-dark) 100%);
          color: var(--purple-dark);
          font-size: 16px;
          font-weight: 700;
          letter-spacing: 0.5px;
          border: none;
          border-radius: 999px;
          cursor: pointer;
          box-shadow: 0 0 24px var(--green-glow);
          transition: transform 0.2s, box-shadow 0.2s;
          text-align: center;
          text-decoration: none;
        }

        .hero-cta:hover {
          transform: translateY(-2px);
          box-shadow: 0 0 32px var(--green-glow);
        }

        .hero-cta:active {
          transform: scale(0.96);
        }

        .hero-divider {
          width: 40px;
          height: 2px;
          background: linear-gradient(90deg, var(--green), transparent);
          border: none;
        }

        /* ── Right content panel ── */
        .index-content {
          flex: 1;
          overflow-y: auto;
          padding: 48px 40px;
          max-width: 760px;
        }

        .content-section {
          background: rgba(255, 255, 255, 0.72);
          backdrop-filter: blur(12px);
          border: 1px solid rgba(255, 255, 255, 0.3);
          border-radius: 16px;
          padding: 24px;
          margin-bottom: 20px;
          box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
        }

        .content-section h2 {
          font-size: 16px;
          font-weight: 800;
          letter-spacing: -0.3px;
          color: var(--purple);
          margin: 0 0 12px;
          text-transform: uppercase;
          font-size: 12px;
          letter-spacing: 1px;
        }

        .content-section ul {
          margin: 0;
          padding-left: 20px;
          color: var(--text-secondary);
          font-size: 14px;
          line-height: 1.8;
        }

        .content-section ul li {
          margin-bottom: 4px;
        }

        .content-section ul ul {
          margin-top: 4px;
        }

        .content-section p {
          color: var(--text-secondary);
          font-size: 14px;
          line-height: 1.7;
          margin: 0 0 8px;
        }

        .content-section p:last-child {
          margin-bottom: 0;
        }

        .content-section a {
          color: var(--purple-light);
          text-decoration: none;
          font-weight: 600;
          border-bottom: 1px solid rgba(74, 66, 128, 0.3);
          transition: color 0.2s;
        }

        .content-section a:hover {
          color: var(--purple);
        }

        .section-label {
          display: inline-flex;
          align-items: center;
          gap: 8px;
          background: rgba(51, 45, 89, 0.1);
          color: var(--purple-light);
          font-size: 11px;
          font-weight: 800;
          letter-spacing: 1.2px;
          text-transform: uppercase;
          padding: 4px 12px;
          border-radius: 999px;
          margin-bottom: 16px;
        }

        .section-label::before {
          content: '';
          width: 6px;
          height: 6px;
          background: var(--green);
          border-radius: 50%;
        }

        /* Twitter widget */
        #tweetbox {
          float: none;
          margin-bottom: 20px;
        }

        #tweetbox .twitter-timeline-rendered {
          border-radius: 12px;
          overflow: hidden;
        }
      </style>
    </head>

    <body>
      <div class="index-layout">

        <!-- LEFT: Hero / CTA Panel -->
        <aside class="index-hero">
          <img src="images/dog-green.png" alt="Sniffer Dog Logo" class="hero-logo" />
          <img src="images/logo-green.png" alt="Sniffer Brand Logo" class="brand-logo" />
          <div class="hero-badge">Cards Against Humanity Clone</div>
          <h1 class="hero-title">
            Pretend<br>You're <span>Xyzzy</span>
          </h1>
          <p class="hero-subtitle">
            O jogo de cartas mais irreverente da internet. Reúna os amigos e veja quem consegue a resposta mais absurda.
          </p>
          <hr class="hero-divider" />
          <a href="game.jsp" class="hero-cta" id="go-to-game-btn">
            Entrar no Jogo →
          </a>
          <p style="color:var(--text-light); font-size:12px; text-align:center; margin:0;">
            Seu IP é registrado ao carregar o cliente.<br>
            Os resultados são anônimos.
          </p>
        </aside>

        <!-- RIGHT: Info Content -->
        <main class="index-content">

          <div id="tweetbox" class="content-section">
            <div class="section-label">Status do Servidor</div>
            <a class="twitter-timeline" data-height="300" data-dnt="true" data-theme="light"
              href="https://twitter.com/_PYX_?ref_src=twsrc%5Etfw">Tweets by _PYX_</a>
            <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
          </div>

          <div class="content-section">
            <div class="section-label">Atualizações Recentes</div>
            <ul>
              <li><strong>3 de Setembro de 2018:</strong>
                <ul>
                  <li>Chat e cartas em branco foram desabilitados.
                    <a
                      href="https://gist.githubusercontent.com/ajanata/07ededdb584f7bb77a8c7191d3a4bbcc/raw/e76faacc19c2bb598a1a8fd94b9ebcb29c5502e0">
                      Saiba o motivo.</a>
                  </li>
                </ul>
              </li>
              <li><a href="changelog.html">Entradas mais antigas.</a></li>
            </ul>
          </div>

          <div class="content-section">
            <div class="section-label">Problemas Conhecidos</div>
            <ul>
              <li><strong>Não abra o jogo mais de uma vez no mesmo navegador.</strong> Nenhuma instância receberá todos
                os dados do servidor.</li>
              <li>Testado extensivamente no <a href="http://google.com/chrome">Google Chrome</a>. Para bugs, <a
                  href="https://github.com/ajanata/PretendYoureXyzzy/issues/new">abra uma issue no GitHub</a> com
                screenshot e versão do browser.</li>
              <li>Você pode não ver sua carta na área superior após jogá-la, mas ela foi registrada.</li>
              <li>Se atualizar a página durante o jogo, um erro aparecerá no log brevemente — é seguro ignorar.</li>
              <li>Você pode ver um erro ao entrar em uma partida. Como a mensagem indica, é seguro ignorar.</li>
              <li>Elementos da interface podem não estar perfeitamente dimensionados logo após o carregamento com
                janelas pequenas. Redimensione para corrigir.</li>
              <li>Recarregar a página quando a carta vencedora está exibida não a mostrará novamente.</li>
              <li>Cartas jogadas podem piscar quando alguém entra ou sai. Atualize a página se for o Czar das Cartas.
              </li>
            </ul>
          </div>

          <div class="content-section">
            <div class="section-label">Limitações Atuais</div>
            <ul>
              <li>Suporte para Cartas Pretas com "pick" e/ou "draw" é básico. As cartas não são agrupadas durante a
                jogada, apenas no julgamento.
                <ul>
                  <li>Não é possível desfazer sua primeira ou segunda carta após jogá-la.</li>
                  <li>Durante o julgamento, apenas uma carta é destacada. Qualquer carta do grupo pode ser clicada.</li>
                  <li>Com muitos jogadores (especialmente Pick 2 ou 3), as cartas podem se sobrepor ou ficar difíceis de
                    clicar.</li>
                </ul>
              </li>
              <li>Não é possível apostar Awesome Points para jogar cartas extras.</li>
            </ul>
          </div>

          <div class="content-section">
            <div class="section-label">Melhorias Futuras</div>
            <ul>
              <li>Pode haver uma opção para exibir quem jogou cada carta.</li>
              <li>Sistema de registro e acompanhamento de estatísticas de longo prazo pode ser adicionado.</li>
            </ul>
          </div>

          <div class="content-section">
            <div class="section-label">Licença &amp; Código Fonte</div>
            <p>
              Pretend You're Xyzzy é um clone de <a href="http://www.cardsagainsthumanity.com/">Cards Against
                Humanity</a>,
              distribuído sob licença
              <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons - Atribuição -
                Não Comercial - Compartilha Igual</a>. Esta versão web não é endossada por cardsagainsthumanity.com.
            </p>
            <p>
              Código-fonte disponível no <a href="https://github.com/ajanata/PretendYoureXyzzy">GitHub</a>.
              Para licenças completas, incluindo bibliotecas, veja a
              <a href="license.html">página de licença completa</a>.
            </p>
          </div>

        </main>
      </div>
    </body>

    </html>