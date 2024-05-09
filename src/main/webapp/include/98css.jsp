<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
		@font-face {
		     font-family: 'DungGeunMo';
		     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
		     font-weight: normal;
		     font-style: normal;
		}
		.text-center{
			text-align:center!important;
		}
		.text-left{
			text-align:left!important;
		}
		.text-right{
			text-align:right!important;
		}
    	html {
            cursor: url(<%=request.getContextPath() %>/images/치이카와.cur), auto;
            font-size: 12pt!important;
            font-family: 'DungGeunMo';
        }
        .container{
            display: grid;
            grid-template-areas: 
                'header header'
                'side content'
                'footer footer';
            grid-template-rows: 150px 1fr 50px;
            grid-template-columns: 28% 72%;
        }
        .item {
            padding: 0px 50px;
        }
        body {
            font-size: 12pt!important;
            font-family: 'DungGeunMo';
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
            grid-area: content;
            width: 80%;
            height: fit-content;
            font-family: 'DungGeunMo';
            text-align: center;
        }
        .form-center {
        	margin: 0 auto;
        	text-align: center;
        	display: inline-block;
        }
		.main-content {
			padding: 0px 30px 30px;
		}
        ul li {
            padding: 4px;
        }
        summary {
            padding: 4px;
            font-size: 9pt;
            width: 100px;
        }
        .sub {
            width: 60%;
            font-size: 1em;
            cursor: pointer;
        }
        .profile {
            width: 40%;
            margin-left: 40%;
        }
        #pp {
            display: flex;
            align-items: center;
            font-size: 1.1em;
            font-weight: bolder;
        }
		.profile-img {
            max-width: 100%;
            max-height: 100%;
        }
        .mobileLogin {
        	display: none;
        }
        table{
    		width: 100%;
    		font-size: 12pt;
    		font-family: 'DungGeunMo';
    	}
    	th, td {
    		border: 1px solid gray;
    		padding:10px!important;
    	}
    	.guest-body-minimize {
    		display: none;
    	}
    	#page-body {
	    	padding: 0;
    	}
    	.pagination {
    		padding: 10px;
    		list-style: none;
    		display: flex;
    		justify-content: center;
    	}
    	pre {white-space: pre-wrap;}
    	.window #tt{font-size:13px}
    	.form-control {width: 100%;}
    	.page-item {width: fit-content;}
    	.loginBtn {width: 70px;}
		button,input[type=reset],input[type=submit]{border:none;border-radius:0;box-sizing:border-box;color:transparent;min-height:23px;min-width:5px;padding:0 12px;text-shadow:0 0 #222}
        .m-0{margin:0!important}.mt-0,.my-0{margin-top:0!important}.mr-0,.mx-0{margin-right:0!important}.mb-0,.my-0{margin-bottom:0!important}.ml-0,.mx-0{margin-left:0!important}.m-1{margin:.25rem!important}.mt-1,.my-1{margin-top:.25rem!important}.mr-1,.mx-1{margin-right:.25rem!important}.mb-1,.my-1{margin-bottom:.25rem!important}.ml-1,.mx-1{margin-left:.25rem!important}.m-2{margin:.5rem!important}.mt-2,.my-2{margin-top:.5rem!important}.mr-2,.mx-2{margin-right:.5rem!important}.mb-2,.my-2{margin-bottom:.5rem!important}.ml-2,.mx-2{margin-left:.5rem!important}.m-3{margin:1rem!important}.mt-3,.my-3{margin-top:1rem!important}.mr-3,.mx-3{margin-right:1rem!important}.mb-3,.my-3{margin-bottom:1rem!important}.ml-3,.mx-3{margin-left:1rem!important}.m-4{margin:1.5rem!important}.mt-4,.my-4{margin-top:1.5rem!important}.mr-4,.mx-4{margin-right:1.5rem!important}.mb-4,.my-4{margin-bottom:1.5rem!important}.ml-4,.mx-4{margin-left:1.5rem!important}.m-5{margin:3rem!important}.mt-5,.my-5{margin-top:3rem!important}.mr-5,.mx-5{margin-right:3rem!important}.mb-5,.my-5{margin-bottom:3rem!important}.ml-5,.mx-5{margin-left:3rem!important}
        #main-font{font-size: 12pt; font-family: 'DungGeunMo';}
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
            grid-template-rows: 30px 1fr;
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
            .login {display:none;}
            .mobileLogin {
            	display: flex;
            	position: absolute;
				right: 0;
				bottom: 100;
        	}
        	.mBtn {width: 16px; height: 15px;}
        }
    </style>