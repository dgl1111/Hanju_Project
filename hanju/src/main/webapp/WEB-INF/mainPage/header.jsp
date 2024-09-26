<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../css/mainPage/header.css" />
    <title>한주</title>
</head>
<body>
    <div id="header">
        <div id="Logo">
            <img src="../../image/haju_rogo_white.png" height="80" alt="한주 로고" />
        </div>
        <div id="center">
            <div class="menu">
                <a href="../market/productList.do">전통주</a>
            </div>
            <div class="menu">
                <a href="../pickup/pickUpLists.do">와인</a>
            </div>
            <div class="menu">
                <a href="">펀딩</a>
            </div>
            <div class="menu">
                <a href>공동구매</a>
            </div>
        </div>
        <div id="right">
            <div v-if="userStatus == 'C'" class="icons">
                <div>로그아웃</div>
                <img class="rightIcon" src="../../image/person.png" @click="fnMyPage">
                <img class="rightIcon" src="../../image/cart.png">
                <img class="rightIcon" src="../../image/heart_plus_white.png">
            </div>
            <div v-else-if="userStatus == 'S'" class="icons" @click="fnSellerPage">
                <div>사업자 페이지</div>
                <img class="rightIcon" src="../../image/person.png">
            </div>
            <div v-else-if="userStatus == 'A'" class="icons">
                <div>관리자 페이지</div>
                <img class="rightIcon" src="../../image/person.png">
            </div>
            <div v-else class="icons" @click="fnLogin">
                <div>로그인</div>
                <img class="rightIcon" src="../../image/person.png">
            </div>
        </div>
    </div>       
</body>
</html>
<script>
    const header = Vue.createApp({
        data() {
            return {
                userId : "${sessionId}",
                userStatus : "${sessionStatus}",
            };
        },
        methods: {
            fnTest() {
                console.log(this.userId);
                console.log(this.userStatus);
            },
            fnSellerPage() {
                location.href = "../sellerPage/sellerMain.do";
            },
            fnLogin() {
                location.href = "../user/login.do";
            },
            fnMyPage() {
                location.href = "../user/myPage.do";
            }
        },
        mounted() {
            this.fnTest();
        }
    });
    header.mount("#header");
</script>