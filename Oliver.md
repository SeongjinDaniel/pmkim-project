# 20200513

개발 일지가 없어졌네요...ㅠㅠ

# 20200518

7eleven 주소 크롤링은 양이 방대해서 긴장을 가지고 크롤링을 하였으나 걱정한것과는 달리 잘 돌아가서 무사히 완료할 수 있었다.

저번 프로젝트때는 Front-end를 수정할 때 더 어려움이 있었는데 이번 프로젝트에는 무사히 수정하여 개발에 수고를 덜었다. 내가 어려워하는 부분은 같이 협업하여 해결하였고 좀 더 쉬운 길을 찾을 수 있었다.(이클립스를 사용하지만 이클립스는 너무 무거워서 툴 자체에 랙이 있었지만 visual studio code로 옮겨서 수정했을 때의 간편함의 희열 크... 감사합니다 to. Haley)

빨리 Back-end 부분으로 넘어가서!! 재밌는 개발을 하고 싶다!!

# 20200519

- R write.csv

```R
write.csv(
  x,              # 파일에 저장할 데이터 프레임 또는 행렬
  file="",        # 데이터를 저장할 파일명
  row.names=TRUE  # TRUE면 행 이름을 CSV 파일에 포함하여 저장한다.
)
write.csv(df, "encoding_test_euc_kr.csv",  row.names = F, fileEncoding = "utf-8")
```

- 오라클 데이터 import export

  https://blog.naver.com/app337/60203195966

  https://offbyone.tistory.com/162

  사이트 참고!!!!

- **Map 사이트**

  각 편의점 지점에 내가 검색한 행사상품이 있는지 보여준다!!ex) 아이스크림이면 아이스크림 행사상품이 있는지 볼수 있음!!

### Today's Development Diary

으아 DB...........

으아 javascript문에서 null 유무를 제대로 체크 못한다. 뭐지..............

-----------

# 20200520

### Today's Development Diary

카카오 서울만 기준으로 나오게  -> cu만 검색하면 우리나라 기준으로 보여줌!!

개발은 끝이 없고 올라야할 산봉우리는 너무 끝에 있도돠!!!!!!!!!!

**개발 플로우를 정리하고 개발할것!!!!**  

### 정규화 vs 비정규화

#### 정규화

관계형 데이터베이스의 설계에서 중복을 최소화하게 데이터를 구조화하는 프로세스를 정규화라고 한다. 데이터베이스 정규화의 목표는 이상이 있는 관계를 재구성하여 작고 잘 조직된 관계를 생성하는 것에 있다. 일반적으로 정규화란 크고, 제대로 조직되지 않은 테이블들과 관계들을 작고 잘 조직된 테이블과 관계들로 나누는 것을 포함한다. 정규화의 목적은 하나의 테이블에서의 데이터의 삽입, 삭제, 변경이 정의된 관계들로 인하여 데이터베이스의 나머지 부분들로 전파되게 하는 것이다.

#### 비정규화

정규화는 되도록 중복된 데이터를 제거해서 성능 향상에 도움을 주것을 목표로 하고 있다. 그러나 과도한 정규화로 인해서 테이블의 수가 증가하게 되면, 다수의 JOIN이 발생함에 따라서 성능 저하가 발생할 수 있다. 보통의 경우 정규화 과정을 모두 거친 다음 마지막 단계에서 비정규화를 실시한다. 단, 테이블을 합치는 것만이 비정규화는 아니다.

- 그룹에 대한 합계와 같은 값을 미리 계산하여 테이블에 저장해 둔다. (얍 플레이스를 예로 들면, 사용자가 좋아요를 하거나 리뷰를 남기면 통계 관련 작업을 해주는데, 통계 테이블을 생성하여 관리하는 것 또한 비정규화라고 해석할 수 있다.)
- 하나의 테이블에서 자주 사용되는 행(레코드)와 그렇지 않은 행들을 분리하여 두 개의 테이블로 나눈다. (이런 경우에는 UNION으로 다시 연결시킨다.)
- 다른 테이블에 의존적이지만 자주 JOIN하여 사용하는 컬럼을 중복하여 테이블 안에 하나 더 생성한다.

copy right) https://gist.github.com/singun/bdceaa99ad61ee1296204454f797d579

# 20200521

회원 ID와 연결해서 처리해야하는 부분으로 인하여 MAP site 잠시 정지!! -> 개발할 때는 회원가입 및 로그인을 먼저 처리하는 것이 좋을것 같음!!

# 20200522

Cart 페이지를 중단하고 우선 효용성있는 빅데이터를 활용할 수 있는 페이지를 만들것 !!

Map 페이지 ----> 로그인 일단 됐다고 가정하고 MAP 페이지 먼저 완성할것!!

# 20200525

카테고리 분류(by Linda) -> Naver API

# 20200526

[https://velog.io/@dlrmsghks7/%ED%83%90%EC%83%89-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%EC%9D%84-%EC%95%8C%EC%95%84%EB%B4%85%EC%8B%9C%EB%8B%A4](https://velog.io/@dlrmsghks7/탐색-알고리즘을-알아봅시다)

이진탐색 추후에 해싱 알고리즘 !! 적용하기!!

#### 주소 확인 - 유사도 분석

https://www.adams.ai/apiPage;jsessionid=0FA2148C1FF03727EC544F0DEEB7ECD7?sentsim



- jar 파일 원래 위치
  - C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib



- 카카오맵과 DB에 저장된 주소가 일치하지 않아 유사도 분석을 하려고 했지만 API가 한정적으로 제공되고 유료화 되는 부분이 있어서 해당 알고리즘을 적용시켜려 했지만, 효율성 측면에서 데이터 전처리를 하여 주소를 일치화 시키는 것이 효율적라고 생각된다 !! -> 결론 : 데이터 전처리



- 맵 사이트 전체 알고리즘 구성 완료!!!!! -> 내일 안에 프로그래밍 완성할것!



- 오늘따라 프로젝트 기간에 촉박함을 느껴 최대한 내일 Map site를 끝내기로 결정!!

# 20200528

Git과 이클립스 연동이 우리팀들은 나와 다른 현상이다.. 문제는 내가 인텔리제이를 설치하면서 무엇인가가 달라진 현상인지 잘 모르겠다.........

# 20200529

JSP에서 VO 객체를 주입하려고 했다니 참 바보같은 생각이었다.

#### Session

```java
// human 객체 생성
Human human = new Human("parker", 26, 178);

// 세션을 가져온다.
HttpSession session = req.getSession(true);
session.setAttribute("parker", human);
```

￭ 세션(Session) 객체 사용하여 값을 저장하고 얻어오기

 -. 웹 브라우저 당 한개씩 자동 생성되는 세션에 값을 저장하거나 세션에 저장된 값을 사용해 본다.

 -. 세션에 값 저장하기 위해서는 session 객체의 setAttribute 메소드를 사용

 -. 세션에 저장된 값을 얻기 위해서는 session 객체의 getAttribute 메소드를 사용



\01. 세션(Session)에 값 저장하기

| 형식 | session.setAttribute(String name, Object value); |
| ---- | ------------------------------------------------ |
|      |                                                  |

 -. session에 값을 저장하기 위해서는 그 값을 저장하는 대상을 식별하기 위한 키가 있어야 한다.

 -. name이 바로 세션에 저장된 특정 값을 찾아오기 위한 키로 사용된다.

 -. 이 키와 일대일 대응으로 저장하고 싶은 값을 value 위치에 지정한다.

 -. name과 value는 1:1 대응이다.

 -. name은 String 형으로 들어가고 value는 Object형이어야만 한다.

  (즉 int, doublic, char등의 primitive 형은 사용할 수 없다.)

 -. 동일한 이름으로 세션에 저장하게 되면, 항상 덮어씌우게 된다.



\02. 세션(Session)에 저장된 값 얻어오기

| 형식 | Object getAttribute(String name) |
| ---- | -------------------------------- |
|      |                                  |

 -. 세션에 저장된 값을 얻어오기 위해 사용되는 getAttribute 메소드를 사용한다.

 -. 세션 객체 안에 지정한 name에 해당되는 속성이 없으면 getAttribute가 null 값을 되돌린다.

 -. 주의할 점은 반환되는 값이 Object형이기 때문에 반드시 적절한 형변환을 해야한다.

 -. 세션에 저장된 값을 String 형태로 얻어오려면 cast 연산자로 형 변환을 해야한다.

   왜냐하면 getAttribute 메소드는 결과값을 Object 형으로 되돌리기 때문이다.

 -. 세션 내부에서는 이를 Object 형으로 관리하고 이를 되돌려질 때에도 Object형으로 되돌린다.

 -. 만일 primitive 형인 int변수에 저장하려면 레퍼 클래스인 Integer 형으로 변환해야 한다.



출처: https://wickedmagic.tistory.com/129 [사악미소의 현대마법의 공방]

#### ArrayList**

- ArrayList의 디폴트 크기는??
  Java.util.ArrayList, Java.util 패키지에 속한 클래스이며,
  List인터페이스를 구현한 가변길이 배열입니다.  

  - 특징 
  배열처럼 인덱스를 통한 접근이 가능하며, 배열은 크기에 제한을 받지만 ArrayList는 원소의 개수가 크기에 다다르면 자동으로 
  initial Capacity만큼 증가하기 때문에 추가적인 원소를 입력하더라도 ArrayIndexOutOfBoundsException 에러가 발생하지 않습니다.

  ```java
  //기본 생성자
  
  List<Integer> list1 = new ArrayList<Integer>();
  
  
  
  //초기 수용량을 지정하는 생성자
  
  ArrayList<Integer> list2 = new ArrayList<Integer>(10);
  
  
  
  /*
  
   * 다른 ArrayList객체를 생성자의 매개변수에 입력하여 ArrayList객체를 생성하는 경우
  
   */
  
  ArrayList<Integer> list3 = new ArrayList<Integer>(list1);
  ```

  첫번재 생성자는 기본생성자입니다. 

  기본생성자는 initial capacity default값이 10이기 때문에 10으로 설정되서 생성이 됩니다. 

  

  \* 여기서 <>를 처음보시는 분들도 계실텐데 이것을 Generic이라고 합니다. 

  Generic은 클래스 외부에서 클래스의 타입을 결정해주는 것이며, 기본자료형의 경우에는 Wrapper클래스를 입력해야 합니다.

  

  두번째 생성자는 initial capacity값을 생성자의 매개변수로 입력하여 ArrayList 객체를 생성합니다. (솔직히 두 번째 생성자는 많이 안 써봤습니다.) 

  

  세번째 생성자는 Collection 인터페이스를 구현한 클래스의 객체를 매개변수로 입력합니다. 

  이 때 입력된 객체의 모든 원소를 생성되는 ArrayList 객체가 할당받습니다. 

  예를 들면 위의 사진에 나온대로 매개변수로 들어온 list1에 원소의 개수가 10개 있었다면 list3는 생성과 동시에 10개의 원소를 갖게 됩니다. 
  
  # 20200530
  
  Ajax는 Asynchronous Javascript And XML 의 약자로, 일반적으로 클라이언트와 서버측의 데이터 전송 및 처리를 비동기적(Asynchronous)으로 처리하는 것에 그 목적이 있습니다.
  
   
  
  Ajax를 사용함으로써, 서버측에 데이터를 요청한 후, 그 데이터의 수신이 완료될 때까지 기다리지 않고, 다른 작업을 바로 진행할 수 있습니다. 그러한 이유로 좀더 웹페이지를 자유롭게 구성할 수 있게 되었고, 불필요한 잦은 페이지 로딩을 줄일 수 있습니다.
  
   
  
  여기서 설명하려는 것은 이런 Ajax는 대부분 비동기방식 그대로 사용하지만, 경우에 따라서는 동기(Synchronous)방식으로 사용할 경우도 종종 생긴다는 것입니다.
  
  이는 Ajax를 통해 서버측에 데이터를 요청하고, 이 데이터의 결과를 모두 수신 받은 다음 단계로 진행하도록 하는 경우가 있을 수 있다는 이야기입니다.
  
   
  
  예를 들면 아래와 같은 코드가 있다고 가정합니다.
  
  ```javascript
  function proc_test() {
   
  
       $('#table > tbody  > tr').each(function() {
            $this = $(this);
  
   
  
            var grade = $this.find("input.grade").val();
            var point = $this.find("input.point").val();
            var param = "&grade=" + grade + "&point=" + point;
  
      
  
            $.ajax({
                 type: 'POST',
                 url: 'interface/grade_process.aspx',
                 data: "worktype=1&" + param,
                 success: function(data) {
                      if(data != null) {
                           // Do somothing when data is not null
                      }
                 }
            });
       });
  
  }
  
  ```
  
  위 코드는 테이블의 한 줄(Row)마다 input grade와 point값을 읽어서 서버측에 Ajax로 데이터를 전달하여 처리를 하는 예제 코드입니다.
  
   
  
  테이블의 20개의 줄(Row)를 가지고 있다고 하면 위의 코드는 20번의 Ajax를 호출하게 됩니다.
  
  Ajax는 비동기 처리이므로 위의 20번 호출은 매우 빠른 속도로 (단순 루프 도는 속도) 서버측에 처리를 요청하게 됩니다.
  
   
  
   
  
  만약 처리 순서를 중요시하는 코드라면 (반드시 첫번째 단계가 끝난다음 두번째 단계가 처리되어야 한다면) 위의 코드는 반드시 문제가 생기게 됩니다. 20번의 Ajax 호출이 인터넷 망을 타고 서버로 전달되는데, 반드시 첫번째 호출한 것이 두번째 호출한 것보다 먼저 도착한다고 장담할 수 없습니다.
  
   
  
  또한 위의 코드처럼 서버측에 무작위로 데이터 처리를 요청하는 것은 경우에 따라 문제가 발생할 소지가 많습니다. 단시간내에 많은 양의 처리를 요구하면 서버측 부하도 많이 발생할 것입니다.
  
   
  
  또 다른 코드를 보겠습니다.
  
  ```javascript
  function proc_test2() {
   
  
       var grade = $this.find("input.grade").val();
       var point = $this.find("input.point").val();
       var param = "&grade=" + grade + "&point=" + point;
  
      
  
       $.ajax({
            type: 'POST',
            url: 'interface/grade_process.aspx',
            data: "worktype=2&" + param,
            success: function(data) {
                 if(data != null) {
  
                      // Do Something;
  
                       ...
  
                 }
            }
       });
  
   
  
       location.href = 'http://www.daum.net';
  
  }
  
  ```
  
  사실 위와 같은 코드를 짜는 것은 조금 바보같지만, 단순히 예를 들기 위해 작성하였습니다. 위의 코드에서 빨간색으로 된 부분은 절대 실행되지 않을 것입니다. 비동기 방식이므로 ajax의 결과를 기다리지 않고, 바로 하단의 코드가 실행되어 현재의 페이지가 다음 메인 페이지로 이동해버리기 때문입니다.
  
   
  
  서버측 응답이 아무리 빠르더라도 클라이언트 코드 처리보다는 느리겠죠.
  
  (location.href = 'http://www.daum.net' 코드 바로 위에 시간이 오래걸리는 산술 연산 같은 것이 있지 않는한은요)
  
   
  
  \---------------------------------------------------------------------------------------------
  
  그러면 Ajax의 처리결과가 모두 완료된 후에 진행되도록 하면 될 것입니다. Ajax는 이름 그대로 비동기 처리 방식이지만 동기 방식도 지원합니다.
  
   
  
  간단히, async 속성 값을 false로 해주시면 됩니다.
  
  그러면 ajax는 더이상 ajax가 아닌 sjax(?)로 동작하게 됩니다.
  
  ```java
  $.ajax({
      type: 'POST',
      url: 'interface/grade_process.aspx',
      data: "worktype=1&" + param,
  
      async: false,
      success: function(data) {
          if(data != null) {
              // Do somothing when data is not null
          }
      }
  });
  ```
  
  ajax니까 이름 그대로 비동기 처리만 되겠지 하지만, 동기 처리 방식도 제공하는 것은 분명 이유가 있습니다. (방법이 간단하지만 잘 모르시는 분들도 많았습니다.)
  
  아직 동기 처리 써보지 못하신 분들은 과연 Ajax를 동기 방식으로 쓰는 경우가 생길까 하시겠지만,
  
  막상 써야 되는 경우가 발생한다면 당황하지 마시고, 간단히 async : false 만 ajax 속성으로 설정해주세요~
  
  출처: https://ooz.co.kr/58 [이러쿵저러쿵]

# 20200601

으 git 브랜치에서 강제로 다른 브랜치로 넘어갔다가 오늘 짠 소스코드 다 날라가버렸음.............

그래도 eclipse에서 local history 기능 때문에 빨리 복구 할수 있었다.. 감사합니다 이클립스 개발자님!!!

멘붕 -> 치킨 -> 해결!! 감사합니다!!! To. Haley

Ajax도 참 고마운 프로그램 기술이구나!!!!!!!!!!!!!!!!! 자유자재로 Controller와의 다리를 열어주어서 너무 고마워!!