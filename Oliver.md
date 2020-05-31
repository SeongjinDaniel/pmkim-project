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



### Today's Development Diary

오늘따라 프로젝트 기간에 촉박함을 느껴 최대한 내일 Map site를 끝내기로 결정!!

# 20200531

요즘은 한글 뿐만이 아니라 국제화를 위해 다국어를 지원하기 위해 UTF-8 인코딩 상태에서 개발을 하는 경우가 많죠. 저도 어느 프로젝트를 가든 UTF-8로 작업을 하게 됨. 예전엔 iframe으로 숨겨서 작업하던 걸 요즘엔 jQuery ajax로 많이 작업을 함. 그런데, UTF-8에서 ajax를 사용하다보면 한글깨짐 현상이 발생함.

이렇게 한글이 깨지는 이유는 무엇인지 해결방법을 알아보자!!

##### ajaxTest.jsp

```javascript
$.ajax({
    type: "post",
    url: "ajaxTestJson.do",
    data: param,
    dataType: "json",
    success: function (jsonObj) {
        alert( jsonObj.ajaxName );
    }
});
```

##### ajaxTest.java

```java
@RequestMapping
@ResponseBody
public String ajaxTestJson(ajaxTestVO vo) throws Exception
       {
    String ajaxName = "Platform별 표준 오디오 설계 구축_I";
    
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("ajaxName", JSONArray.fromObject(ajaxName, MarketingAnonymousClass.getJsonConfig()));
    
    return jsonObj.toString();
}
```

위 프로그램의 실행 순서는 다음과 같습니다.

1. ajax로 ajaxTestJson.do 호출

2. ajaxTextJson.do가 ajaxTest.java의 ajaxTestJson 메소드를 호출한다.

3. ajaxName 값을 가져와서 ajax 호출한 곳에 값을 보낸다. (인코딩 필요)

4. ajax로 ajaxName 값을 받는다. (디코딩 필요) 

5. ajaxName 값을 alert() 함수로 화면에 출력한다.

**java 파일에서 ajax로 값이 넘어올 때 한글이 깨지게 되므로 java 파일에서 UTF-8로 인코딩을 해서 ajax로 넘겨준 후에 ajax에서 받아서다시 디코딩을 해주면 한글이 깨지지 않고 잘 출력이 됩니다.**

##### ajaxTest.jsp

```javascript
$.ajax({
    type: "post",
    url: "ajaxTestJson.do",
    data: param,
    dataType: "json",
    success: function (jsonObj) {
 
        // 디코딩하여 변수에 담는다.
        var ajaxName = decodeURIComponent( jsonObj.ajaxName );
 
        alert( ajaxName );
    }
});
```

```
decodeURIComponent( 변수 ); 
```

##### ajaxTest.java

```java
@RequestMapping
@ResponseBody
public String ajaxTestJson(ajaxTestVO vo) throws Exception
       {
    String ajaxName = "Platform별 표준 오디오 설계 구축_I";
 
    // 한글깨짐 방지를 위해 인코딩하기
    URLEncoder.encode(ajaxName , "UTF-8");
    
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("ajaxName", JSONArray.fromObject(ajaxName, MarketingAnonymousClass.getJsonConfig()));
    
    return jsonObj.toString();
}
```

```
URLEncoder.encode(변수, "UTF-8");
```

위와같이 인코딩/디코딩 변환을 해주면 한글이 깨지지 않고 잘 나오게 된다



그런데, 이렇게만 했을 때, 공백이 +로 변환되는 문제가 있어요. 아래처럼 디코딩하기 전에 +를 공백으로 바꿔주시면 해결!! 변수명이 con이라고 할때 아래처럼 하면 된당!!

```
var Ca = /\+/g;
decodeURIComponent( con.replace(Ca, " ") );
```

