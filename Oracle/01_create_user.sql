-- 새로운 사용자 생성
CREATE USER yjh IDENTIFIED BY 1234;

-- 사용자에게 모든 권한 부여 (필요에 따라 수정 가능)
GRANT ALL PRIVILEGES TO yjh;

-- 필요에 따라 특정 테이블스페이스를 지정할 수도 있습니다
-- ALTER USER yjh DEFAULT TABLESPACE users;

-- 필요 시 더 많은 SQL 명령을 추가할 수 있습니다
