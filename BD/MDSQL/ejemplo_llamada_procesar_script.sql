declare
	  p_script           sm2_k_ld_MDSQL.t_t_linea;
	  p_lista_obj_his    sm2_k_ld_MDSQL.t_t_obj_his;
	  p_txt_descripcion VARCHAR2(500);
	  p_id_proceso       NUMBER;
	  p_fec_proceso      DATE;
	  p_cod_estado_proc  NUMBER;
	  p_des_estado_proc  VARCHAR2(30);
	  p_lista_scripts    sm2_k_ld_MDSQL.t_t_script;
	  p_resultado        INTEGER;
	  p_lista_errores    sm2_k_ld_MDSQL.t_t_error;

begin

	p_script(1).txt_linea := 'CREATE TABLE SMD_LD.PROVEEDORES(';
	p_script(2).txt_linea := 'COD_PROVEEDOR VARCHAR2(10) NOT NULL,';
	p_script(3).txt_linea := 'TXT_NOMBRE VARCHAR2(50) NOT NULL';
	p_script(4).txt_linea := 'TXT_NOMBRE VARCHAR2(50) NOT NULL,';
	p_script(5).txt_linea := 'TXT_APELLIDO1 VARCHAR2(50) NOT NULL,';
	p_script(6).txt_linea := 'TXT_APELLIDO2 VARCHAR2(50),';
	p_script(7).txt_linea := 'COD_DOCUM VARCHAR2(10) NOT NULL';
	p_script(8).txt_linea := ');';

  	-- Call the procedure
	sm2_k_ld_MDSQL.p_procesa_script(p_script,
                                  'SMD', --p_cod_proyecto
                                  'SMD', --p_cod_sub_proy
                                  'AA133-BB456', --p_cod_peticion
                                  NULL, --p_cod_demanda
                                  'USER1', --p_cod_usr
                                  'USER2', --p_cod_usr_peticion
                                  'N', --p_mca_reprocesa
                                  'FD012', --p_nom_BBDD
                                  'SMD_LD', --p_nom_esquema
                                  'N', --p_mca_HIS
                                  NULL, --p_nom_BBDD_HIS
                                  NULL, --p_nom_esquema_his
                                  'Fichero.sql', --p_nom_fich_entrada
                                  'C:\ruta', --p_txt_ruta_entrada => :p_txt_ruta_entrada,
                                  p_lista_obj_his, -- p_lista_obj_his,
                                  'descricion', -- p_txt_descripcion
                                  p_id_proceso,
                                  p_fec_proceso,
                                  p_cod_estado_proc,
                                  p_des_estado_proc,
                                  p_lista_scripts,
                                  p_resultado,
                                  p_lista_errores);
                                  
	IF p_lista_errores.count > 0 then
		FOR I IN p_lista_errores.first .. p_lista_errores.last LOOP
			DBMS_OUTPUT.PUT_LINE(p_lista_errores(I).txt_error);
		END LOOP;
  	END IF;

end; 
