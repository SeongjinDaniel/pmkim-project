# 4차 theme 관련 테이블 생성 

```sql
-- theme & goods_theme table 생성
-- 연관된 키는 변동 안되므로 각자 테이블만 생성해주면 됨

--theme 생성
CREATE TABLE theme
(
    theme_code       VARCHAR2(100)    NOT NULL, 
    theme_name       VARCHAR2(100)    NOT NULL, 
    search_name_1    VARCHAR2(100)    NULL, 
    search_name_2    VARCHAR2(100)    NULL, 
    search_name_3    VARCHAR2(100)    NULL, 
    CONSTRAINT THEME_PK PRIMARY KEY (theme_code)
)
/

COMMENT ON COLUMN theme.theme_code IS '테마 코드'
/

COMMENT ON COLUMN theme.theme_name IS '테마 명'
/

COMMENT ON COLUMN theme.search_name_1 IS '조사 명 1'
/

COMMENT ON COLUMN theme.search_name_2 IS '조사 명 2'
/

COMMENT ON COLUMN theme.search_name_3 IS '조사 명 3'
/

--goods_theme 생성
CREATE TABLE goods_theme
(
    good_theme_id    INT              NOT NULL, 
    theme_code       VARCHAR2(100)    NULL, 
    good_id          VARCHAR2(20)     NULL, 
    CONSTRAINT GOODS_THEME_PK PRIMARY KEY (good_theme_id)
)
/

CREATE SEQUENCE goods_theme_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER goods_theme_AI_TRG
BEFORE INSERT ON goods_theme 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT goods_theme_SEQ.NEXTVAL
    INTO :NEW.good_theme_id
    FROM DUAL;
END;
/

--DROP TRIGGER goods_theme_AI_TRG;
/

--DROP SEQUENCE goods_theme_SEQ;
/

COMMENT ON COLUMN goods_theme.good_theme_id IS '상품 테마 아이디'
/

COMMENT ON COLUMN goods_theme.theme_code IS '테마 코드'
/

COMMENT ON COLUMN goods_theme.good_id IS '상품 아이디'
/

ALTER TABLE goods_theme
    ADD CONSTRAINT FK_goods_theme_good_id_goods_g FOREIGN KEY (good_id)
        REFERENCES goods (good_id)
/

ALTER TABLE goods_theme
    ADD CONSTRAINT FK_goods_theme_theme_code_them FOREIGN KEY (theme_code)
        REFERENCES theme (theme_code)
/
```

