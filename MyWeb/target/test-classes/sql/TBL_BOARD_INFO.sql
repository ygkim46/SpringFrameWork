CREATE TABLE BOARD_INFO (
	REG_DTIME DATE NOT NULL,
	MBR_NO VARCHAR(10) NOT NULL,
	TITLE VARCHAR(100) NOT NULL,
	SEQ INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


INSERT INTO BOARD_INFO (REG_DTIME,MBR_NO,TITLE) VALUES (
now(),
'2222',
'2'
);
commit;

select * from BOARD_INFO;

INSERT INTO BOARD_INFO (REG_DTIME,MBR_NO,TITLE) VALUES (
			now(),
			'2222',
			'2'
		);


DECLARE
BEGIN
	FOR i in 1..10 LOOP
	dbms_output.put_line('출력숫자'|| i);	
	END LOOP;
END; 



DELIMITER ;;
-- drop procedure usp_2;
create procedure usp_2 (IN var INT)
begin
	declare cnt INT default 0;
	loop_A:loop
		IF(var <= cnt) then
			leave loop_A;
		END IF;
		SET cnt = cnt+1;
		INSERT INTO BOARD_INFO (REG_DTIME,MBR_NO,TITLE) VALUES (
			now(),
			'2222',
			concat('title-', cast(cnt as char))
		   );
end loop;
	select * from board_info;
end;;

DELIMITER ;


call usp_2(100);
