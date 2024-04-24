<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/98.css">
    <title>한나네 집</title>
    <style>
        html {
            cursor: url(media/치이카와.cur), auto;
        }
        .container{
            display: grid;
            grid-template-areas: 
                'header header'
                'side content'
                'footer footer';
            grid-template-rows: 150px 1fr 100px;
            grid-template-columns: 30% 70%;
        }
        .item {
            padding: 50px;
        }
        body {
            padding: 0px;
            margin: 0 auto;
            background-image: url(media/bg.gif);
        }
        .sbody {
            margin: 0 auto;
            width: 100%;
            grid-area: side;
        }
        .menu {
            width: 41%;
            margin-top: 3%;
            margin-left: 40%;
        }
        .main {
            margin-top: 50px;
            grid-area: content;
            width: 80%;
        }
        ul li {
            padding: 4px;
            font-size: 9pt;
            width: 30px;
        }
        summary {
            padding: 4px;
            font-size: 9pt;
            width: 60px;
        }
        .sub {
            width: 30px;
            font-size: 1em;
            cursor: pointer;
        }
        .profile {
            width: 40%;
            margin-left: 40%;
        }
        p {
            display: flex;
            align-items: center;
            font-size: 1.1em;
            font-weight: bolder;
        }
        .window-body img {
            max-width: 100%;
            max-height: 100%;
        }
        /* 아이패드 프로 */
        @media screen and (min-width:1024px) and (max-width:1199px) {
            .sbody {
                width: 96%;
            }
            .main {
                width: 78%;
            }
        }
        /* 태블릿 */
        @media screen and (min-width:768px) and (max-width:1023px) {
            .item {
                padding: 0px;
            }
            body {
                padding: 0px;
            }
            .sbody {
                margin: 0 auto;
                width: 110%;
                grid-area: side;
            }
            .main {
                margin-top: 0px;
            }
        }
        /* 핸드폰 */
        @media screen and (max-width:767px) {
            .container{
            display: grid;
            grid-template-areas: 
                'header'
                'side'
                'content'
                'footer';
            grid-template-rows: 0px 1fr;
            grid-template-columns: 100%;
            }
            .sbody {
                width: 70%;
            }
            .menu {
                width: 100%;
                margin-top: 0%;
                margin-left: 0%;
            }
            .main {
                margin: 0 auto;
                width: 80%;
                margin-top: 0px;
            }
            .profile {
                width: 40%;
                margin-left: 40%;
                display: none;
            }
        }
        </style>
</head>
<body>
    <div class="container">
        <section>
            <div class="item header"></div>
        </section>
        <section class="item sbody">
            <div class="window profile">
                <div class="title-bar">
                    <div class="title-bar-text">프로필</div>
                    <div class="title-bar-controls">
                        <button aria-label="Close"></button>
                    </div>
                </div>
                <div class="window-body">
                    <div class="field-row-stacker">
                        <img src="media/profile.png" />
                        <br/>
                        <p>
                            <img src="media/star.png" style="width: 10%;" />
                            <b>김한나</b>
                        </p>
                        안녕하세요
                        <br/><br/>
                    </div>
                </div>
            </div>
            <div class="menu">
                <ul class="tree-view">
                    <div style="color: #ccc; pointer-events: none;">카테고리</div>
                    <li><a href="http://192.168.50.66:9090/javaclass/">Home</a></li>
                    <li><a href="">Notice</a></li>
                    <hr/>
                    <li><a href="">Project</a></li>
                    <hr/>
                    <li><a href="media/memo.html">Memo</a></li>
                </ul>
            </div>
        </section>
        <div class="window main">
            <div class="title-bar">
                <div class="title-bar-text">한나네 집에 오신 걸 환영합니다!</div>
                <div class="title-bar-controls">
                    <button aria-label="Minimize"></button>
                    <button aria-label="Maximize"></button>
                    <button aria-label="Close"></button>
                </div>
            </div>
            <div class="window-body">
                <div class="field-row-stacked">
                    <img width="100%" src="media/4.jpg" />
                </div>
            </div>
        </div>
        <section>
            <div class="item footer"></div>
        </section>
    </div>
</body>
</html>