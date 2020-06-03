# AWS Server Connect

1. `PuTTY `

   - `Host Name` 에 Host Address 복사해서 붙여넣기

     ```
     ec2-13-209-196-2.ap-northeast-2.compute.amazonaws.com 
     ```

   - `SSH` - `Auth` - `Private key` 입력 `browse` : `ppk`파일 찾아서 열기

   - 다시 `Session` 으로 가서 `Saved Sessions` 에서 입력 : `aws_pmkim`

   - `save`

   - `alert` 뜨면 `yes`

2. Linux 화면

   - login as : `id` 입력 (여기선 lab04)

3. FileZilla

   - `파일` 밑에 `사이트 관리자` 열기
   - `호스트` : `호스트 주소` 입력
   - 프로토콜 : SFTP로 변경
   - 로그온 유형 : 키파일
   - 사용자 이름 : lab04
   - 키파일 찾아서 저장
   - `연결`

4. 오라클 연결
   - 새로운 연결 생성 : aws_rds
   - 사용자 이름 / 비번 : team2
   - 호스트 이름 : `xe.cljkqcsbb9ok.ap-northeast-2.rds.amazonaws.com`
   - 포트 : database