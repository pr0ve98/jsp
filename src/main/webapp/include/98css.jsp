<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
		@font-face {
		     font-family: 'DungGeunMo';
		     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
		     font-weight: normal;
		     font-style: normal;
		}
    	html {
            cursor: url(<%=request.getContextPath() %>/images/치이카와.cur), auto;
            font-family: 'DungGeunMo';
        }
        .container{
            display: grid;
            grid-template-areas: 
                'header header'
                'side content'
                'footer footer';
            grid-template-rows: 50px 1fr 50px;
            grid-template-columns: 30% 70%;
        }
        .item {
            padding: 50px;
        }
        body {
            padding: 0px;
            margin: 0 auto;
            background-image: url(<%=request.getContextPath() %>/images/bg.gif);
        }
        .loginBtn {
        	width: 50px;
        	height: 20px;
        	float:right;
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
            height: 630px;
            font-family: 'DungGeunMo';
            font-size: 1rem;
        }
		.main-content {
		    height: 600px;
		    overflow-y: auto;
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
            width: 100px;
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