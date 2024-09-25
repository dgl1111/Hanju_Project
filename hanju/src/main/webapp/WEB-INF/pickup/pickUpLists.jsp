<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/mainCss.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/productList/lists.css"
    />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>한주</title>
  </head>
  <body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="app">
      <section class="selectSection">
        <!-- 카테고리 버튼 클릭 (1) -->
        <div class="productsListSelect">
            <a href="javascript:void(0);">
                <span class="selected">둘러보기</span>
            </a>
            <a href="javascript:void(0);">
                <span>신상품</span>
            </a>
            <a href="javascript:void(0);">
                <span>베스트</span>
            </a>
        </div>
        <!-- 선택 코드 리스트 영역 1 -->
        <div class="kindList">
          <label v-for="item in codeList">
            <input type="checkbox" v-model="selectCodes" :value="item.code" @change="PickUpList">
            {{item.codeName}}
          </label>
        </div>
        <!-- 선택 코드 리스트 영역 2 -->
        <select v-model="alcohol" @change="PickUpList">
          <option value="">-- 도수 --</option>
          <option value="1">:: 10도 미만 ::</option>
          <option value="2">:: 10도 이상 ::</option>
        </select>
        <select v-model="sweet" @change="PickUpList">
          <option value="">-- 단맛 --</option>
          <option value="1">:: 약함 ::</option>
          <option value="2">:: 중간 ::</option>
          <option value="3">:: 강함 ::</option>
        </select>
        <select v-model="sour" @change="PickUpList">
          <option value="">-- 신맛 --</option>
          <option value="1">:: 약함 ::</option>
          <option value="2">:: 중간 ::</option>
          <option value="3">:: 강함 ::</option>
        </select>
        <select v-model="sparkling" @change="PickUpList">
          <option value="">-- 탄산유무 --</option>
          <option value="1">:: 없음 ::</option>
          <option value="2">:: 있음 ::</option>
        </select>
        <select v-model="body" @change="PickUpList">
          <option value="">-- 바디감 --</option>
          <option value="1">:: 약함 ::</option>
          <option value="2">:: 좋음 ::</option>
          <option value="3">:: 매우좋음 ::</option>
        </select>
        <select v-model="capacity" @change="PickUpList">
          <option value="">-- 용량 --</option>
          <option value="1">:: 400ml 미만 ::</option>
          <option value="2">:: 400ml ~ 700ml ::</option>
          <option value="3">:: 700ml 이상 ::</option>
        </select>
        <select v-model="material" @change="PickUpList" class="materialList">
          <option value="">-- 품종 --</option>
          <option v-for="item in products" :value="item.material">:: {{ item.material }} ::</option>
        </select>
    </section>
      </section>
      <!-- 상품 리스트 영역 -->
      <section class="productContainer">
        <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
        <ul v-for="item in products">
          <li class="productList">
            <a href="javascript:void(0); ">
              <div>
                <div class="img-wrap">
                  <img :src="item.filePath" :alt="item.fileOrgName" />
                </div>
                <p class="productName.wine">{{ item.productName }}</p>
                <p class="price">\ {{ item.priceComma }}</p>
                <span class="mini">원산지 {{ item.madeBy }}</span>
                <p class="material">
                  <span class="mini title">품종</span> {{ item.material }}
                </p>
                <p>평점 0.0</p>
              </div>
            </a>
          </li>
        </ul>
      </section>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        products: [],
        codeList : [],
        selectCodes : [],
        alcohol : "",     // 알콜 도수
        sweet : "",       // 당도
        sour : "",        // 산미
        sparkling : "",   // 탄산 유무
        body : "",        // 바디감
        capacity : "",    // 용량
        material : [],    // 품종
        madeBy : ""       // 원산지
      };
    },
    methods: {
      GetCodeLists(){   // 선택 체크박스
        var self = this;
				var paramap = {};
				$.ajax({
					url:"codeList.dox",
					dataType:"json",	
					type : "POST", 
					data : paramap,
					success : function(data) {
						self.codeList = data.list;
					}
				});
      },
      PickUpList() {  // 와인 픽업 리스트
          var self = this;
          var paramap = {};
          if(self.selectCodes.length > 0){
            var fCode = JSON.stringify(self.selectCodes);
            paramap = {
              selectCodes : fCode,
              alcohol : self.alcohol,
              sweet : self.sweet,
              sour : self.sour,
              sparkling : self.sparkling,
              body : self.body,
              capacity : self.capacity,
              material : self.material,
              madeBy : self.madeBy
            };
          } else {
            paramap = {
              alcohol : self.alcohol,
              sweet : self.sweet,
              sour : self.sour,
              sparkling : self.sparkling,
              body : self.body,
              capacity : self.capacity,
              material : self.material,
              madeBy : self.madeBy
            };
        }
        $.ajax({
            url: "pickUpLists.dox",
            dataType: "json",
            type: "POST",
            data: paramap,
            success: (data) => {
              self.products = data.pickup;
            },
        });
      },
    },
    mounted() {
      var self = this;
      self.PickUpList();
      self.GetCodeLists();
    },
  });
  app.mount("#app");
</script>