# 게시물 삭제시 시퀀스 오류 해결
## 2021/12/12
### goottboard 개선
goottboard로 게시판을 구현했을때, 게시물이 1개만 있을경우에  
그 게시물을 삭제할 경우, 시퀀스가 꼬이는 문제가 있었습니다.  
기존에는 시퀀스를 수정하는 방법으로 하여 통일감을 주기위해서 똑같은 방법으로  
가능할것이라 판단했지만, 시퀀스의 최소값 밑으로 내려가면 시퀀스가 올바르게 작동하지 않아  
1개만 있을 경우에 삭제를 하면 그 시퀀스를 DROP후, 다시 CREATE 하는 작업을 통해 문제를 해결하였습니다.

### 파일 업로드 & 다운로드 추가
1.업로드  
업로드의 경우, MultipartRequest를 통해서 form으로부터 file을 받고 DefaultFileRenamePolicy를 통해서  
기본적인 중복만을 해결할 수 있도록 하였습니다. 그리고 서버의 경로를 받아 이를 통해 파일의 구체적인  
경로를 설정해주었습니다. 이렇게 업로드된 파일은 수정이나 삭제 작업이 진행될 경우, 같이 삭제될 수 있도록  
처리하였습니다.  

2.다운로드  
다운로드의 경우,FileInputStream으로 파일의 실제 경로로 파일을 불러오고  
response객체의 Header와 ContentType을 수정하여 파일을 다운로드할 수 있도록 변경하였습니다.  
그리고 한글 이름의 경우, 깨지는 현상이 발생하여 제목을 8859_1로 변환하여 한글 이름으로 된 파일도  
이름이 정상적으로 출력될 수 있도록 하였습니다.  
마지막으로 파일을 바이트 형태의 파일을 보내기 위해서 ServletOutputStream을 사용하여 파일을 보냈습니다.
아직 익숙하지 않은 형태이기때문에 조금 더 연습이 필요할것 같습니다.