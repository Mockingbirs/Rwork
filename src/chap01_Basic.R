# chap01_Basic : 주석문 기호

##############################
#  Chapter01. R 설치와 개요
##############################

# 주요 단축키
# - script 실행 : ctrl+Enter, ctrl+R
# - script 저장 : ctrl+s(현재 파일), ctrl+alt+s(전체파일저장)

# Library 등록.
# - C:/Program Files/R/R-4.1.2/etc/Rprofile.site 파일에 .libPaths("C:/myRLib/Library") 추가 혹은
# - 사용자 변수 새로 만들기 : 변수 이름 -> R_LIBS, 변수 값 : C:\Users\user\Documents\R\win-library\4.1 으로 셋팅.

print("Hello, R!!!") # ctrl+Enter

## 패키지와 Session 보기

# R package 보기

dim(available.packages()) #18688 17
available.packages()

# 패키지 사용법
install.packages("stringr") #패키지 설치
library("stringr") # 메모리에 로딩 : " " 생략 가능
search() #패키지 메모리 로딩 확인

# 패키지 제거
remove.packages("stringr")

# R session 보기
sessionInfo()

# 데이터 셋 보기
data()

# 기본 데이터 셋으로 히스토그램 그리기
# 단계 1 : 빈도수(frequency)를 기준으로 히스토그램 그리기
hist(Nile)

#단계 2 : 밀도(density)를 기준으로 히스토그램 그리기
hist(Nile, freq = F)

#단계 3 : 단계2의 결과에 분포곡선(line)을 추가
lines(density(Nile))

# 히스토그램을 파일에 저장하기.
par(mfrow=c(1,1))  #pots 영역에 1개(1행,1열열) 그래프 표시

pdf("c:/workspaces/Rwork/output/batch.pdf")
hist(rnorm(20))
dev.off()

?hist


## 4. 변수와 자료형
# 변수 사용 예
age <- 25
age
age <- 35
age

# 변수.멤버  형태로 변수 선언 예


var1 <- 50
var2 <- 100


goods.model <-"lg=320" #상품 모델명명
goods.name <-"냉장고"
goods.price <-"850000"
goods.desc<-"동급 최고 품질/사양양"


# 스칼라 변수 사용 예
name <- "홍길동"
name

# 자료형
int <- 20    # 숫자형(정수)
double <- 3.14 # 숫자형(실수)
string <- "홍길동"  # 문자형
boolean <- TRUE  # 진리값 : TRUE(T) / FALSE(F)
boolean

boolean <- 3.14
boolean

# 자료형 확인
is.numeric(int) #TRUE
is.integer(int) #FALSE : 정수 값도 부동소수점으로 관리.
is.double(int) #TRUE

castInt <-as.integer(int) #형변환환
is.integer(castInt) #TRUE
is.numeric(double) #TRUE

is.character(double)#FALSE
is.character(string) #TRUE
is.character("double") #TRUE



# 문자 원소를 숫자 원소로 형변환
x <- c(1, 2, 3)
x

# 숫자 원소를 문자 원소로 형변환
y <- c(1, 2, "3")
y

result <- x * 3
result


result <- y * 5 

result <- as.integer(y) * 5
result


# 복소수형 자료 생성과 형변환
z <- 5.3 - 3i
Re(z) #실수부
Im(z) #허수부부
is.complex(z) # TRUE 복소수 확인
as.complex(5.3) # 5.3+0i 복소수로 변화

# 스칼라 변수의 자료형
mode(int)
mode(string)
mode(boolean)

# 문자 벡터와 그래프 생성
gender <- c('man', 'woman', 'woman', 'man', 'man')
gender

mode(gender) #스칼라 자료형의 값
class(gender) #벡터 자료형의 값값

plot(gender)

# 요인형 변환
# as.factor() 함수 이용 범주(요인)형 변환  
Ngender <- as.factor(gender)    #  factor는 domain 반환, 빈도수까지 반환
Ngender   #domain(Levels로 표시) : man woman   
table(Ngender)

# Factor형 변수로 차트 그리기
plot(Ngender)
mode(Ngender) #numeric
class(Ngender)  #factor
is.factor(Ngender)  #true
is.numeric(Ngender) #false  is는 class를 받는다
# Factor Nominal 변수
Ngender   #데이터(빈도) 정보 / 도메인 정보보

# factor() 함수 이용 Factor형 변환
args(factor) # ?factor
?factor
Ogender <- factor(gender, levels = c('woman', 'man'), labels=c("여자","남자"), ordered = T)  # levels에 domain 순서를 지정 할 수 있음


# 순서 없는 요인과 순서 있는 요인형 변수로 차트 그리기
par(mfrow=c(1,2))
plot(Ngender)
plot(Ogender)


# 도움말 보기
i <- sum(1, 2, 3)
i

help(sum)
?sum

# 함수 파라메터 보기
args(sum)

# 함수 사용 예제 보기
example(sum)

# 작업 공간 지정
getwd()
setwd("c:/workspaces/Rwork/data")
