# chap02_DataStructure

######################################
# chapter02. 데이터의 유형과 구조
######################################

# 1. Vector 자료 구조
##  - C() 함수 이용 벡터 객체 생성
x <- c(1, 2, 3, 4, 5)  #combine 함수 동일한 자료형의 데이터를 저장 가능
x

x <- c(1:20) # 콜론 : 범위
x

y <- 10:20
y

##  - seq() 함수 이용 벡터 객체 생성
x <- seq(1, 10, 2) #sequence(시작, 종료, 증감)
x

##  - rep() 함수 이용 벡터 객체 생성
help(rep)
example(rep)
rep(1:3, 3)   #replicate(대상, 반복수)
# 1 2 3 1 2 3 1 2 3
rep(1:3, each=3)   
# 1 1 1 2 2 2 3 3 3

# union(), setdiff(), intersect() 함수 이용
x <- c(1, 3, 5, 7)
y <- c(3, 5)
x; y

union(x, y)     # 합집합(x+y)
setdiff(x, y)   # 차집합(x-y)
intersect(x, y) # 교집합(x^y)

# 숫자형, 문자형, 논리형 벡터 생성
v1 <- c(33, -5, 20:23, 12, -2:3)
v1
v2 <- c(33, -5, 20:23, 12, "4") # 데이터를 모두 문자형으로 변환.
v2


# 한 줄에 명령문 중복 사용
v1; mode(v1)
v2; mode(v2)

# 벡터에 컬럼명 지정
age <- c(30, 35, 40)
age
names(age) <- c("홍길동", "이순신", "강감찬") #이름을 지정해줄 수 있는 함수수 names()
age
age<- NULL #age변수 데이터 삭제

# 벡터 자료 참조하기
a <-c(1:50)
a[10]   #index : 1부터시작
a[c(10:45)]
a[c(10, 20, 30, 40)]
a[10:(length(a)-5)]

# 잘못된 벡터 첨자 사용 예
a[5, 10] # Error in a[5, 10] : incorrect number of dimensions


# c() 함수에서 콤마 사용 예
v1 <- c(33, -5, 20:23, 12, -2:3)
v1
v1[1]
v1[c(2,6)]
v1[c(2,3:5,7)]
v1[3:5]  #c()생략가능

# 음수 값으로 첨자 지정 예
v1[-1] #해당 위치의 원소를 제외한 값 출력
v1[-c(2,4)]


# 패키지 설치와 메모리 로딩
install.packages("RSADBE") # 패키지(데이터) 설치
library(RSADBE)            # 패키지를 메모리에 로드

data("Severity_Counts")    # RSADBE 패키지에서 제공되는 데이터 셋 가져오기.
str(Severity_Counts)

# 패키지에서 제공되는 벡터데이터 셋 보기
Severity_Counts


# 2. Matrix 자료 구조

# 벡터 이용 행렬 객체 생성
m <- matrix(c(1:5))
m  # 5행 1열

# 벡터의 열 우선으로 행렬 객체 생성
?matrix
m <- matrix(c(1:10), nrow = 2) # 2행 5열
m

# 행과 열의 수가 일치하지 않는 경우 예
m <- matrix(c(1:11), nrow = 2)
m

# 벡터의 행 우선으로 행렬 객체 생성
m<- matrix(c(1:10), nrow= 2, byrow = T)
m

m<- matrix(c(1:10), byrow = T) # 주의 - 여전히 10행 1열 nrow, ncol 이 사용되지않으면default는 colum을 1개만 생성한다. 즉 byrow속성은 적용되지 않음.
m

m<- matrix(c(1:10), ncol=10) # 의도한 1행 10열
m<- matrix(c(1:10),nrow=1, byrow = T) # 의도한 1행 10열
m

# 행 묶음으로 행렬 객체 생성
x1 <- c(5, 40, 50:52)
x2 <- c(30, 5, 6:8)
mr <- rbind(x1, x2)
mr
# 열 묶음으로 행렬 객체 생성
mc <- cbind(x1,x2)
mc
# 2행으로 행렬 객체 생성
m3 <- matrix(10:19,2)
m3

# 자료와 객체 type 보기
mode(m3); class(m3) # numeric, matrix


# 행렬 객체에 첨자로 접근
m3[2,3]  # 2행 3열의 데이터 1개 : 15
m3[1,] # 1행 전체 데이터 호출
m3[,2] # 2열 전체 데이터 호출
m3[1,c(2:5)] # 1행 2~5열 데이터 호출
m3[1,c(2,5)] # 1행 2열과 5열 데이터 호출
m3[1,2:5]


# 3행 3열로 행렬 객체 생성
x<-matrix(c(1:9), nr=3, nc=3)
x

# 자료의 개수 보기
length(x) # 데이터 개수
ncol(x); nrow(x) # 열 / 행 수


# apply() 함수 적용
apply(x,1,max)  # (함수, 행or열,조건) 1=행, 2=열  조건=max, min, mean(최대값, 최솟값, 평균값)
apply(x,1,min)
apply(x,2,mean)


# 사용자 정의 적용
f <- function(x){ # : 매개변수
  x * c(1,2,3)
}

# 행 우선 순서로 사용자 정의 함수 적용
result <-apply(x, 1, f)
result
# 열 우선 순서로 사용자 정의 함수 적용
result <- apply(x,2,f)
result
# 행렬 객체에 컬럼명 지정하기
colnames(x) <- c('one','two','three')
x

## 3. Array 자료 구조

# 3차원 배열 객체 생성하기
vec <- c(1:12) # 12개 벡터 객체 생성
arr <- array(vec,c(3,2,2))   #행, 열, 면 의 순서로 정의
arr

# 3차원 배열 객체 자료 조회
arr[2,1,2]
arr[,,2]
# 배열 자료형과 자료 구조
mode(arr); class(arr)


# 데이터 셋 가져오기
library(RSADBE)
data(Bug_Metrics_Software)
str(Bug_Metrics_Software)

# 데이터 셋 자료보기
Bug_Metrics_Software



## 4. List 자료 구조

# key를 이용하여 value에 접근하기
member <- list(name=c('홍길동','유관순'), 
               age=c(35,25), 
               adress=c("서울","경기도"), 
               gender=c("남자","여자"),
               htype=c('아파트','오피스텔')
               )
member

# key를 이용하여 value에 접근하기
member$name
member$name[2]
member$name[3] <- "이순신" # 데이터 추가 가능.
member$id <- c("hong", 'you','lee') # 데이터 추가

member$list <- NULL  #  NULL 사용 시 데이터 삭제(list key 삭제) 

member$age <- 45  # 데이터 수정 (주의 - 기존의 데이터가 다 사라지고 입력한 하나의 값으로 수정)

# 1개 값을 갖는 리스트 객체 생성
list <- list("lee", "이순신", 35)
list

""" 
[[1]]         ----------> key(생략) [[n]]  key값이 없을 땐 [[]] 대괄호가 2개붙는다.
[1] "lee"     ----------> value[n]

[[2]]
[1] "이순신"

[[3]]
[1] 35

"""

# 1개 이상의 값을 갖는 리스트 객체 생성
num <- list(c(1:5),c(6:10))
num

# 리스트 자료구조 -> 벡터 구조로 변경하기
unlist <- unlist(num)
unlist

# 리스트 객체에 함수 적용하기
# list data 처리 함수
a <- list(c(1:5)) #데이터 타입 : numeric 데이터 구조 : list
b <- list(c(6:10)) 
a; b



c(a,b)

c<-lapply(c(a,b),max) #list로 결과 반환
c
mode(c) ; class(c) #list는 key value의 형태로 존재하기때문에 자료형을 특정하기 어려워 자료형이 list로 출력된다
# "list" "list"


# 리스트 형식을 벡터 형식으로 반환하기
c <- sapply(c(a,b),max)
c
mode(c); class(c) # "numeric" "integer"

# 다차원 리스트 객체 생성
multi_list <- list(list(1,2,3), list('a','b','c'), list(100,200,300))
multi_list
multi_list <- list(c1=list(1,2,3), c2=list(10,20,30), c3=list(100,200,300))
multi_list

multi_list$c1
multi_list$c2
multi_list$c3

mode(multi_list); class(multi_list)

# 다차원 리스트를 열 단위로 바인딩
d <- do.call(cbind, multi_list)
d
class(d) # "matrix" "array"



## 5. Data Frame 자료 구조

# 벡터 이용 객체 생성
no  <- c(1, 2, 3)
name <- c("홍길동", "이순신", "강감찬")
pay <- c(150, 250, 300)
vemp <- data.frame(No=no,Name=name,Pay=pay)
vemp
class(vemp) # "data.frame"

# matrix 이용 객체 생성
args(matrix)
m <- matrix(c(1,"홍길동", 150,
              2,"이순신", 250,
              3, "강감찬", 300),3 , byrow = T)
m
class(m)

memp <- data.frame(m)
memp
class(memp)

# txt 파일 이용 객체 생성
getwd()
setwd("C:/workspaces/Rwork/data")

txtemp <- read.table('emp.txt', header = T, sep = "")
txtemp
class(txtemp)


# csv 파일 이용 객체 생성(header=T)
csvtemp <- read.csv('emp.csv', header = T, sep="")
csvtemp; class(csvtemp)


# csv 파일 이용 객체 생성(header=F)
name <- c("사번", "이름", "급여")
csvtemp2 <- read.csv("emp2.csv", header = F, col.names = name)
csvtemp2


# 데이터프레임 만들기
df <- data.frame(x=c(1:5), y=seq(2,10,2), z=c('a','b','c','d','e'))
df

# 데이터프레임 컬럼명 참조
df$x

# 자료구조, 열수, 행수, 컬럼명 보기
str(df)
ncol(df)
nrow(df)
df[c(2:3)]

# 요약 통계량 보기
summary(df)

# 데이터프레임 자료에 함수 적용
apply(df[,c(1,2)], 2, sum)

# 데이터프레임의 부분 객체 만들기
x1 <- subset(df, x >= 3) # x가 3이상인 레코드 대상
x1

y1 <- subset(df, y <= 8) # y가 8이하인 레코드 대상
y1

# 두 개의 조건으로 부분 객체 만들기
xyand <- subset(df, x>=2 & y<=6)
xyand

xyor <- subset(df, x>=2 | y<=6)
xyor

# student 데이터프레임 만들기
sid <- c('A','B','C','D')
score <- c(90, 80, 70, 60)
subject <- c('컴퓨터', '국어국문', '소프트웨어', '유아교육')

student <- data.frame(sid, score, subject)
student

# 자료형과 자료구조 보기
mode(student); class(student) # list, data.frame
str(sid); str(score); str(subject)
str(student)

# 두 개 이상의 데이터프레임 병합하기
height <- data.frame(id=c(1,2), h=c(180, 175))
weight <- data.frame(id=c(1,2), w=c(80,75))
height; weight

person <- merge(height , weight, by.x="id", by.y="id")
person


# galton 데이터 셋 가져오기
install.packages("UsingR") # 패키지 설치
library(UsingR) # 패키지 메모리에 로드
data("galton") # galton 데이터 셋 가져오기
View(galton)

# galton 데이터 셋 구조 보기
str(galton)
dim(galton)
head(galton, 20)
head(galton) # default 갯수:6 앞에서
tail(galton) # default 갯수:6 뒤에서


## 6. 문자열 처리

# 문자열 추출하기
install.packages("stringr") # 패키지 설치
library(stringr) # 메모리 로딩

# 형식) str_extract('문자열', '정규표현식')
str_extract("홍길동35이순신45강감찬50","[0-9]{2}")
str_extract_all("홍길동35이순신45강감찬50","[0-9]{2}")


# 반복수를 지정하여 영문자 추출
string <- 'hongkildong105lee1002you25강감찬2005'
str_extract_all(string, '[a-z]{3}') # 3글자 연속된 알파벳 추출
str_extract_all(string, '[a-z]{3,}') # 3글자 이상 연속된 알파벳 추출
str_extract_all(string, '[a-z]{3,5}')# 3~5글자 범위에 속하는 연속된 알파벳 추출

# 특정 단어 추출
str_extract_all(string, '유관순')
str_extract_all(string, '강감찬')


# 한글, 영문자, 숫자 추출하기
str_extract_all(string, 'hong')
str_extract_all(string, '25')
str_extract_all(string, '[가-힣]{3,}') # 한글 검색
str_extract_all(string, '[a-z]{3}') # 소문자 검색
str_extract_all(string, '[A-Z]{3}') # 대문자 검색
str_extract_all(string, '[0-9]{4}') # 숫자 검색


# 한글, 영문자, 숫자를 제외한 나머지 추출하기
str_extract_all(string, '[^a-z]') # 영문자 제외
str_extract_all(string, '[^a-z]{4}') # 영문자 제외 4글자 연속된 문자 추출
str_extract_all(string, '[^가-힣]{5}') # 한글을 제외
str_extract_all(string, '[^0-9]{3}') # 숫자제외


# 주민등록번호 검사하기
jumin <- '123456-3234567'
str_extract_all(jumin, '[0-9]{6}-[1234][0-9]{6}')
str_extract_all(jumin, '\\d{6}-[1-4]\\d{6}')

# 지정된 길이의 단어 추출하기
name <- '홍길동1234,이순신5678,강감찬1012'
str_extract_all(name, '\\w{7,}') 
# '\\w' : 한글/영문자/숫자 포함. 특수문자 제외.
# '\\W' : 특수문자 선택.
str_extract_all(name, '\\W')

# 문자열 위치(index) 구하기
string <- 'hongkd105leess1002you25강감찬2005'
str_locate(string, '강감찬')

# 문자열 길이 구하기
string <- 'hongkild105lee1002you25강감찬2005'
len <- str_length(string) # 30
len

# 부분 문자열
string_sub <- str_sub(string, 1, len-7)
string_sub

string_sub <- str_sub(string, 1, 23)
string_sub

# 대문자, 소문자 변경하기
str_to_upper(string_sub)
str_to_lower(string_sub)

# 문자열 교체하기
string_rep <- str_replace(string_sub, 'hongkild105', '홍길동35,')
string_rep <- str_replace(string_rep, 'lee1002', '이순신45,')
string_rep <- str_replace(string_rep, 'you25', '유관순25,')
string_rep


# 문자열 결합하기
string_c <- str_c(string_rep, '강감찬55')
string_c


# 문자열 분리하기
string_sp <- str_split(string_c, ',')
string_sp

# 문자열 합치기
string_vec <- c('홍길동35', '이순신45', '유관순25', '강감찬55')
string_vec

string_join <- paste(string_vec, collapse = ',')
string_join

