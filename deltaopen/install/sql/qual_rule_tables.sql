CREATE SEQUENCE RULE_ID_SEQ INCREMENT BY 1 START WITH 1000;
CREATE SEQUENCE RULE_TEST_ID_SEQ INCREMENT BY 1 START WITH 1000;


-- 
-- TABLE: QUAL_RULE 
--

CREATE TABLE TEMP_QUAL_RULE(
    RULE_ID              NUMBER(10, 0)    NOT NULL,
    RULE_NAME            VARCHAR2(60),
    ACTION               VARCHAR2(30),
    TEST_RULE            CHAR(1)          
                         CHECK (TEST_RULE in ('Y', 'N')),
    IS_ACTIVE            CHAR(1)          
                         CHECK (IS_ACTIVE in ('Y', 'N')),
    VERSION              NUMBER(10, 0),
    CREATION_DATE        DATE,
    MODIFICATION_DATE    DATE,
    DELETED              CHAR(1)          DEFAULT 'N' 
                         CHECK (DELETED in ('Y', 'N')),
    CONSTRAINT T_PK_QUAL_RULE PRIMARY KEY (RULE_ID)
) 
;


-- 
-- TABLE: QUAL_RULE_ACCESSOR_OPERAND 
--

CREATE TABLE TEMP_QRULE_ACCESSOR_OPERAND(
    ACCESSOR_ID      NUMBER(10, 0)    NOT NULL,
    UI_CATEGORY      VARCHAR2(20),
    UI_NAME          VARCHAR2(60),
    UI_TYPE          VARCHAR2(20),
    INTERNAL_NAME    VARCHAR2(60),
    JESS_TYPE        VARCHAR2(20),
    JESS_ACCESSOR    VARCHAR2(100),
    CONSTRAINT T_PK_QRULE_ACCESSOR_OPERAND PRIMARY KEY (ACCESSOR_ID)
) 
;


-- 
-- TABLE: QUAL_RULE_HISTORY 
--

CREATE TABLE TEMP_QUAL_RULE_HISTORY(
    RULE_ID              NUMBER(10, 0)    NOT NULL,
    MODIFICATION_DATE    DATE             NOT NULL,
    DESCRIPTION          VARCHAR2(100)
) 
;


-- 
-- TABLE: QUAL_RULE_OPERATOR 
--

CREATE TABLE TEMP_QUAL_RULE_OPERATOR(
    OPERATOR_ID    NUMBER(10, 0)    NOT NULL,
    UI_NAME        VARCHAR2(60),
    JESS_NAME      VARCHAR2(60),
    OP1_TYPE       VARCHAR2(60),
    OP2_TYPE       VARCHAR2(60),
    CONSTRAINT T_PK_QUAL_RULE_OPERATOR PRIMARY KEY (OPERATOR_ID)
) 
;


-- 
-- TABLE: QUAL_RULE_TEST 
--

CREATE TABLE TEMP_QUAL_RULE_TEST(
    RULE_ID                    NUMBER(10, 0)    NOT NULL,
    RULE_TEST_ID               NUMBER(10, 0)    NOT NULL,
    PARENT_TEST_ID             NUMBER(10, 0)    NOT NULL,
    LOGICAL_OPERATOR           VARCHAR2(25),
    LOGICAL_TEST_NAME          VARCHAR2(60),
    TEST_TYPE                  VARCHAR2(25),
    OPERAND_1_TYPE             VARCHAR2(20),
    OPERAND_1_LITERAL_TYPE     VARCHAR2(20),
    OPERAND_1_LITERAL_VALUE    VARCHAR2(100),
    OPERAND_1_ACCESSOR_ID      NUMBER(10, 0),
    OPERAND_2_TYPE             VARCHAR2(20),
    OPERAND_2_LITERAL_TYPE     VARCHAR2(20),
    OPERAND_2_LITERAL_VALUE    VARCHAR2(100),
    OPERAND_2_ACCESSOR_ID      NUMBER(10, 0),
    OPERATOR_ID                NUMBER(10, 0),
    CONSTRAINT T_PK_QUAL_RULE_TEST PRIMARY KEY (RULE_ID, RULE_TEST_ID)
) 
;
