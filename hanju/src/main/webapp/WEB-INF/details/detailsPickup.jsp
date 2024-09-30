<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <link rel="stylesheet" href="/css/details.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <script src="/js/axios.min.js"></script>
    <script src="https://unpkg.com/@vuepic/vue-datepicker@latest"></script>
    <link
      rel="stylesheet"
      href="https://unpkg.com/@vuepic/vue-datepicker@latest/dist/main.css"
    />
    <title>document</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>
  <body>
    <div id="app">
      <div class="container">
        <div class="thumb">
          <div class="image-container">
            <img :src="img.productImage[currentImageIndex]" class="thumb-img" />
            <div class="dots">
              <span
                v-for="(image, index) in img.productImage"
                :key="index"
                class="dot"
                :class="{ active: currentImageIndex === index }"
                @click="setCurrentImage(index)"
              ></span>
            </div>
          </div>
          <div class="thumb-content">
            <div>
              <div class="pad2">{{ info.description }}</div>
              <div class="font-size">{{ info.productName }}</div>
              <div class="pad2">판매가격 :</div>
              <div class="font-size">{{ info.price }}원</div>
            </div>
          </div>
        </div>
        <div class="side-bar">
          <div class="font-size2">수량</div>
          <div class="row pad">
            <div>
              <button @click="decrease" class="q-control font-size2">-</button>
            </div>
            <div>
              <input
                type="text"
                class="input-box font-size2"
                @input="inputNumber"
                v-model="cnt"
              />
            </div>
            <div>
              <button @click="increase" class="q-control font-size2">+</button>
            </div>
          </div>
          <div class="pad font-size2">총 상품가격</div>
          <div class="font-size2">{{ sum() }}원</div>
          <div class="pad font-size2">픽업매장 선택</div>
          <button @click="modalOpen" class="side-button font-size2">
            픽업매장 선택
          </button>
          <div class="modal-wrap" v-show="modalCheck" @click="modalOpen">
            <div class="modal-container" @click.stop="">
              <h4>픽업매장 리스트</h4>
              <ul>
                <li v-for="info in list">
                  {{ info.storeName }}
                  <button
                    @click="pickUpStoreSelect(info.storeId)"
                    class="modal-button"
                    v-model="storeId"
                  >
                    선택
                  </button>
                </li>
              </ul>
              <button @click="modalOpen" class="modal-button">닫기</button>
              <div class="modal-btn"></div>
            </div>
          </div>
          <div class="">
            <vue-date-picker v-model="date" locale="ko"></vue-date-picker>
            <!-- <div class="modal-wrap" v-show="modalCheck2" @click="modalOpen2">
                <div class="modal-container" @click.stop="">
                    <input type="date" v-model="pickUpDate">
                <div class="modal-btn">
                <button @click="modalOpen2" class="modal-button">닫기</button>
                <button @click="selectDate" class="modal-button">선택</button>
                </div>
            </div>
            </div> -->
          </div>
          <div>
            <button
              v-if=""
              @click="showToastMessage"
              class="side-button font-size2"
            >
              장바구니
            </button>
          </div>
          <div>
            <button class="side-button font-size2">바로 구매하기</button>
          </div>
        </div>
        <div class="box" style="clear: both">
          <div class="row">
            <div class="title">주종</div>
            <div class="box-content">{{ info.codeName }}</div>
          </div>
          <div class="row">
            <div class="title">도수</div>
            <div class="box-content">{{ info.alcohol }}%</div>
          </div>
          <div class="row">
            <div class="title">용량</div>
            <div class="box-content">{{ info.capacity }}ml</div>
          </div>
          <div class="row">
            <div class="title">생산지</div>
            <div class="box-content">{{ info.madeBy }}</div>
          </div>
          <div class="row">
            <div class="title">주재료</div>
            <div class="box-content">{{ info.material }}</div>
          </div>
        </div>

        <div class="box">
          <div class="row">
            <div class="title">단맛</div>
            <div class="img-chart">
              <div v-if="info.sweet == 0">
                <img src="../../image/chart0.png" />
              </div>
              <div v-if="info.sweet == 1">
                <img src="../../image/chart1.png" />
              </div>
              <div v-if="info.sweet == 2">
                <img src="../../image/chart2.png" />
              </div>
              <div v-if="info.sweet == 3">
                <img src="../../image/chart3.png" />
              </div>
              <div v-if="info.sweet == 4">
                <img src="../../image/chart4.png" />
              </div>
              <div v-if="info.sweet == 5">
                <img src="../../image/chart5.png" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="title">산미</div>
            <div class="img-chart">
              <div v-if="info.sour == 0">
                <img src="../../image/chart0.png" />
              </div>
              <div v-if="info.sour == 1">
                <img src="../../image/chart1.png" />
              </div>
              <div v-if="info.sour == 2">
                <img src="../../image/chart2.png" />
              </div>
              <div v-if="info.sour == 3">
                <img src="../../image/chart3.png" />
              </div>
              <div v-if="info.sour == 4">
                <img src="../../image/chart4.png" />
              </div>
              <div v-if="info.sour == 5">
                <img src="../../image/chart5.png" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="title">씁쓸</div>
            <div class="img-chart">
              <div v-if="info.bitter == 0">
                <img src="../../image/chart0.png" />
              </div>
              <div v-if="info.bitter == 1">
                <img src="../../image/chart1.png" />
              </div>
              <div v-if="info.bitter == 2">
                <img src="../../image/chart2.png" />
              </div>
              <div v-if="info.bitter == 3">
                <img src="../../image/chart3.png" />
              </div>
              <div v-if="info.bitter == 4">
                <img src="../../image/chart4.png" />
              </div>
              <div v-if="info.bitter == 5">
                <img src="../../image/chart5.png" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="title">바디</div>
            <div class="img-chart">
              <div v-if="info.body == 0">
                <img src="../../image/chart0.png" />
              </div>
              <div v-if="info.body == 1">
                <img src="../../image/chart1.png" />
              </div>
              <div v-if="info.body == 2">
                <img src="../../image/chart2.png" />
              </div>
              <div v-if="info.body == 3">
                <img src="../../image/chart3.png" />
              </div>
              <div v-if="info.body == 4">
                <img src="../../image/chart4.png" />
              </div>
              <div v-if="info.body == 5">
                <img src="../../image/chart5.png" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="title">탄산</div>
            <div class="img-chart">
              <div v-if="info.sparkling == 0">
                <img src="../../image/chart0.png" />
              </div>
              <div v-if="info.sparkling == 1">
                <img src="../../image/chart1.png" />
              </div>
              <div v-if="info.sparkling == 2">
                <img src="../../image/chart2.png" />
              </div>
              <div v-if="info.sparkling == 3">
                <img src="../../image/chart3.png" />
              </div>
              <div v-if="info.sparkling == 4">
                <img src="../../image/chart4.png" />
              </div>
              <div v-if="info.sparkling == 5">
                <img src="../../image/chart5.png" />
              </div>
            </div>
          </div>
        </div>
        <div style="clear: both">
          <img :src="img.detailImage" class="detail-img" />
        </div>

        <!-- 리뷰 페이지 -->
        <div>
          <div v-for="list in comment">
            <div class="review-box">
              <div class="review-name">{{ list.userName }}</div>
              <div
                style="
                  display: flex;
                  justify-content: flex-end;
                  margin-right: 10px;
                "
              >
                <div class="review">{{ info.productName }}</div>
                <div class="img-grade review">
                  <div v-if="list.grade == 0">
                    <img src="../../image/grade0.png" />
                  </div>
                  <div v-if="list.grade == 1">
                    <img src="../../image/grade1.png" />
                  </div>
                  <div v-if="list.grade == 2">
                    <img src="../../image/grade2.png" />
                  </div>
                  <div v-if="list.grade == 3">
                    <img src="../../image/grade3.png" />
                  </div>
                  <div v-if="list.grade == 4">
                    <img src="../../image/grade4.png" />
                  </div>
                  <div v-if="list.grade == 5">
                    <img src="../../image/grade5.png" />
                  </div>
                </div>
                <div>{{ list.cDateTime }}</div>
              </div>
            </div>
            <div class="review-box4">
              <div class="review-box2">{{ list.content }}</div>
              <div class="review-box3">
                <img :src="list.filePath" class="review-img" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 토스트 메시지 요소 추가 -->
      <div id="tost_message">장바구니에 추가되었습니다!</div>
      <div id="login_message">로그인을 해주세요!</div>
      <div id="jago_message">재고가 부족합니다. 재고 : {{ pStock }}</div>
    </div>

    <script>
      const app = Vue.createApp({
        data() {
          return {
            info: {},
            img: {},
            number: 1,
            userId: "",
            cnt: 1,
            pStock: "",
            modalCheck: false,
            modalCheck2: false,
            selectedDate: null,
            list: [],
            pickUpDate: "",
            storeId: "",
            date: new Date(),
            pickupId: "",
            sellId:"",
            groupId : "",
            img: { productImage: [] },
            currentImageIndex: 0,
          };
        },
        components: {
          VueDatePicker,
        },
        methods: {
          fnPayment() {
            const pId = "여기 제품 아이디";
            const sId = " 여기 스토어 아이디";
            const date = "여기 날짜";
            const cnt = "여기 수량";
            location.href = `/cart/directPayment.do?pId=\${pId}&cnt=\${cnt}&sId=\${sId}&date=\${date}`;
          },
          fnGetList() {
            var self = this;
            const asdf = {
              pickupId: this.pickupId,
              sellId : "",
              groupId : "",
            };
            $.ajax({
              url: "detailsPickUp.dox",
              dataType: "json",
              type: "POST",
              data: asdf,
              success: function (data) {
                self.info = data.pickUpProduct[0];
                self.list = data.pickUpProduct;
                self.img = data.img;
                self.comment = data.comment;
                console.log(self.img);
                console.log(self.list);
              },
            });
          },
          nextImage() {
            if (this.currentImageIndex < this.img.productImage.length - 1) {
              this.currentImageIndex++;
            } else {
              this.currentImageIndex = 0; // 처음으로 돌아가기
            }
          },
          prevImage() {
            if (this.currentImageIndex > 0) {
              this.currentImageIndex--;
            } else {
              this.currentImageIndex = this.img.productImage.length - 1; // 마지막으로 돌아가기
            }
          },
          setCurrentImage(index) {
            this.currentImageIndex = index;
          },
          inputNumber(event) {
            this.number = event.target.value;
          },
          decrease() {
            if (this.cnt > 1) {
              this.cnt--;
            }
          },
          modalOpen() {
            this.modalCheck = !this.modalCheck;
          },
          selectDate() {
            console.log(this.pickUpDate);
            this.modalOpen2();
          },
          fnDatePicker() {
            const date = document.getElementById("datePicker");
            date.showPicker("show");
            console.log(date.showPicker);
          },
          pickUpStoreSelect(storeId) {
            console.log(storeId);
            this.modalOpen();
          },
          modalOpen2() {
            this.modalCheck2 = !this.modalCheck2;
          },
          increase() {
            this.cnt++;
          },
          sum() {
            return this.cnt * this.info.price;
          },
          async showToastMessage() {
            if (this.userId == "") {
              const tostMessage = document.getElementById("login_message");
              tostMessage.classList.add("active"); // 토스트 메시지 표시
              setTimeout(() => {
                tostMessage.classList.remove("active"); // 1초 후에 숨김
              }, 2000);
              return;
            }

            var self = this;
            const cart = {
              productId: self.info.productId,
              userId: self.userId,
              productCount: self.cnt,
              kind: "P",
              pickupDate: self.pickUpDate,
              storeId: self.storeId,
            };
            const url = "/cart/addCart.dox";
            const res = await axios.post(url, cart);
            const susses = res.data;
            console.log(susses);
            if (
              susses.status == "newAddCart" ||
              susses.status == "oldAddCart"
            ) {
              const tostMessage = document.getElementById("tost_message");
              tostMessage.classList.add("active"); // 토스트 메시지 표시
              setTimeout(() => {
                tostMessage.classList.remove("active"); // 1초 후에 숨김
              }, 2000);
            } else if (susses.status == "outOfStock") {
              this.pStock = susses.pStock;
              const tostMessage = document.getElementById("jago_message");
              tostMessage.classList.add("active"); // 토스트 메시지 표시
              setTimeout(() => {
                tostMessage.classList.remove("active"); // 1초 후에 숨김
              }, 2000);
            } else {
              alert("서버 오류");
            }
          },
        },
        mounted() {
          this.userId = "${userId}";
          this.pickupId = "${pickupId}";
          this.fnGetList();
        },
        watch: {
          number(val) {
            const reg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z]/;
            if (reg.exec(val) !== null) {
              this.number = val.replace(/[^0-9]/g, "");
            }
          },
        },
      });
      app.mount("#app");
    </script>
  </body>
</html>
