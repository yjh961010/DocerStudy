
ALTER SESSION SET CURRENT_SCHEMA = yjh;
-- 트리거 생성(시작일 입력 시 자동으로 종료일 생성)
CREATE OR REPLACE TRIGGER yjh.set_end_date  -- 스키마를 명시적으로 지정
BEFORE INSERT OR UPDATE ON neSavProd
FOR EACH ROW
BEGIN
    IF :NEW.start_date IS NOT NULL THEN
        CASE :NEW.subscription_period
            WHEN '1년' THEN
                :NEW.end_date := :NEW.start_date + INTERVAL '1' YEAR;
            WHEN '6개월' THEN
                :NEW.end_date := :NEW.start_date + INTERVAL '6' MONTH;
            WHEN '3개월' THEN
                :NEW.end_date := :NEW.start_date + INTERVAL '3' MONTH;
            WHEN '1개월' THEN
                :NEW.end_date := :NEW.start_date + INTERVAL '1' MONTH;
        END CASE;
    END IF;
END;
/
