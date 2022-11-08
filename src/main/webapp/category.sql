  CREATE TABLE "TJOEUNIT"."CATEGORY"  (
    "IDX" NUMBER(*,0) NOT NULL ENABLE, 
    "CATEGORY" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"GUP" NUMBER(*,0), 
	"LEV" NUMBER(*,0), 
	"SEQ" NUMBER(*,0), 
	 CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("IDX")
 

delete from category;
drop SEQUENCE category_idx_seq;
create SEQUENCE category_idx_seq;