INSERT INTO property VALUES ('PROP1', '청담e-편한세상1차 103동 11층', '아파트', '매매', '20억', '매물 특징 : 급매.소유주직접.현장업소.남향.로얄층.올수리.확장 \n 해당층/총층 : 11/17층 \n 방수/욕실수 : 3/2개 \n 관리비 : 30만원 \n 입주가능일 : 즉시입주 협의가능', '서울시' , '청담동', '101.41/81.84', 'cheongdam1');

UPDATE property
SET b_district = '강남구'
WHERE b_id = 'PROP1';

UPDATE property
SET b_city = '서울시'
WHERE b_id = 'PROP2428';

SELECT * FROM property;
