--------------------------------------------------------
--  DDL for Package Body SM2_K_LD_MDSQL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "SAPIENS"."SM2_K_LD_MDSQL" AS

  procedure p_procesa_script(p_script           IN t_t_linea,
                             p_cod_proyecto     IN VARCHAR2,
                             p_cod_sub_proy     IN VARCHAR2,
                             p_cod_peticion     IN VARCHAR2,
                             p_cod_demanda      IN VARCHAR2,
                             p_cod_usr          IN VARCHAR2,
                             p_cod_usr_peticion IN VARCHAR2,
                             p_mca_reprocesa    IN VARCHAR2,
                             p_nom_BBDD         IN VARCHAR2,
                             p_nom_esquema      IN VARCHAR2,
                             p_mca_HIS          IN VARCHAR2,
                             p_nom_BBDD_HIS     IN VARCHAR2,
                             p_nom_esquema_his  IN VARCHAR2,
                             p_nom_fich_entrada IN VARCHAR2,
                             p_txt_ruta_entrada IN VARCHAR2,
                             p_lista_obj_his    IN t_t_obj_his,
                             p_txt_descripcion  IN VARCHAR2,
                             p_id_proceso       IN OUT NOCOPY NUMBER,
                             p_fec_proceso      OUT NOCOPY DATE,
                             p_cod_estado_proc  OUT NOCOPY NUMBER,
                             p_des_estado_proc  OUT NOCOPY VARCHAR2,
                             p_lista_scripts    OUT NOCOPY t_t_script,
                             p_resultado        IN OUT NOCOPY INTEGER,
                             p_lista_errores    IN OUT NOCOPY t_t_error) AS
    v_sysdate DATE;
    v_mca_errores VARCHAR2(1);
    v_script_id NUMBER;
    v_linea_script_id NUMBER;
    v_tipo_script VARCHAR2(20);
    v_script_lanza t_r_script_lanza;
    v_num_orden NUMBER;
    v_cod_estado_script NUMBER;
    v_des_estado_script VARCHAR(20);
  BEGIN
    p_resultado := C_RESULTADO_OK;
	v_sysdate := SYSDATE;
    p_cod_estado_proc := 1;
    p_des_estado_proc := 'Generado';
    v_mca_errores := 'N';
    v_cod_estado_script := 1;
    v_des_estado_script := 'Pendiente';
    
    
    -- Crea el proceso
    select SEQ_ID_PROCESO.nextval INTO p_id_proceso from dual;
    
    insert into proceso
        values(p_cod_proyecto, p_id_proceso, p_cod_peticion, p_cod_usr_peticion, 
            v_sysdate, p_cod_usr, p_cod_estado_proc, p_des_estado_proc, 
            p_mca_HIS, p_txt_descripcion, '', v_mca_errores);
    
    -- Crea los scripts
    select SEQ_ID_SCRIPT.nextval INTO v_script_id from dual;
    v_script_lanza := create_script_lanza(p_nom_fich_entrada, p_txt_ruta_entrada, p_nom_esquema);
    v_num_orden := 1;
    v_tipo_script := 'SQL';
    insert into script
        values(v_script_id, p_nom_fich_entrada, 
            p_txt_ruta_entrada, v_tipo_script, 
            v_cod_estado_script, v_des_estado_script, 
            v_num_orden, v_script_lanza.nombre, v_script_lanza.txt, 
            p_nom_fich_entrada || '.log', p_id_proceso, '');
        
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        select SEQ_ID_LINEA_SCRIPT.nextval INTO v_linea_script_id from dual;  
        
        insert into lineas_script
            values(v_linea_script_id, v_script_id, p_script(I).txt_linea);
    END LOOP;
    
    p_lista_scripts(1).tip_script := v_tipo_script;
    p_lista_scripts(1).nom_script := p_nom_fich_entrada;
    p_lista_scripts(1).cod_estado_scrip := v_cod_estado_script;
    p_lista_scripts(1).des_estado_scrip := v_des_estado_script;
    p_lista_scripts(1).num_orden := v_num_orden;
    p_lista_scripts(1).nom_script_lanza := v_script_lanza.nombre;
    p_lista_scripts(1).txt_script_lanza := v_script_lanza.txt;
    p_lista_scripts(1).nom_script_log := p_nom_fich_entrada || '.log';
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        p_lista_scripts(1).txt_script(I).txt_linea := p_script(I).txt_linea; 
    END LOOP;
    
    select SEQ_ID_SCRIPT.nextval INTO v_script_id from dual;
    v_script_lanza := create_script_lanza(p_nom_fich_entrada || '.pdc', p_txt_ruta_entrada, p_nom_esquema);
    v_num_orden := 2;
    v_tipo_script := 'PDC';
    insert into script
        values(v_script_id, p_nom_fich_entrada, 
            p_txt_ruta_entrada, v_tipo_script, 
            v_cod_estado_script, v_des_estado_script, 
            v_num_orden, v_script_lanza.nombre, v_script_lanza.txt, 
            p_nom_fich_entrada || '.log', p_id_proceso, '');
        
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        select SEQ_ID_LINEA_SCRIPT.nextval INTO v_linea_script_id from dual;  
        
        insert into lineas_script
            values(v_linea_script_id, v_script_id, p_script(I).txt_linea);
    END LOOP;
    
    p_lista_scripts(2).tip_script := v_tipo_script;
    p_lista_scripts(2).nom_script := p_nom_fich_entrada || '.pdc';
    p_lista_scripts(2).cod_estado_scrip := v_cod_estado_script;
    p_lista_scripts(2).des_estado_scrip := v_des_estado_script;
    p_lista_scripts(2).num_orden := v_num_orden;
    p_lista_scripts(2).nom_script_lanza := v_script_lanza.nombre || '.pdc';
    p_lista_scripts(2).txt_script_lanza := v_script_lanza.txt;
    p_lista_scripts(2).nom_script_log := p_nom_fich_entrada || '.pdc.log';
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        p_lista_scripts(2).txt_script(I).txt_linea := p_script(I).txt_linea; 
    END LOOP;
    
    select SEQ_ID_SCRIPT.nextval INTO v_script_id from dual;
    v_script_lanza := create_script_lanza(p_nom_fich_entrada || '.sqlh', p_txt_ruta_entrada, p_nom_esquema);
    v_num_orden := 3;
    v_tipo_script := 'SQLH';
    insert into script
        values(v_script_id, p_nom_fich_entrada, 
            p_txt_ruta_entrada, v_tipo_script, 
            v_cod_estado_script, v_des_estado_script, 
            v_num_orden, v_script_lanza.nombre, v_script_lanza.txt, 
            p_nom_fich_entrada || '.log', p_id_proceso, '');
        
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        select SEQ_ID_LINEA_SCRIPT.nextval INTO v_linea_script_id from dual;  
        
        insert into lineas_script
            values(v_linea_script_id, v_script_id, p_script(I).txt_linea);
    END LOOP;
    
    p_lista_scripts(3).tip_script := v_tipo_script;
    p_lista_scripts(3).nom_script := p_nom_fich_entrada || '.sqlh';
    p_lista_scripts(3).cod_estado_scrip := v_cod_estado_script;
    p_lista_scripts(3).des_estado_scrip := v_des_estado_script;
    p_lista_scripts(3).num_orden := v_num_orden;
    p_lista_scripts(3).nom_script_lanza := v_script_lanza.nombre || '.sqlh';
    p_lista_scripts(3).txt_script_lanza := v_script_lanza.txt;
    p_lista_scripts(3).nom_script_log := p_nom_fich_entrada || '.sqlh.log';
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        p_lista_scripts(3).txt_script(I).txt_linea := p_script(I).txt_linea; 
    END LOOP;
    
    select SEQ_ID_SCRIPT.nextval INTO v_script_id from dual;
    v_script_lanza := create_script_lanza(p_nom_fich_entrada || '.pdch', p_txt_ruta_entrada, p_nom_esquema);
    v_num_orden := 4;
    v_tipo_script := 'PDCH';
    insert into script
        values(v_script_id, p_nom_fich_entrada, 
            p_txt_ruta_entrada, v_tipo_script, 
            v_cod_estado_script, v_des_estado_script, 
            v_num_orden, v_script_lanza.nombre, v_script_lanza.txt, 
            p_nom_fich_entrada || '.log', p_id_proceso, '');
        
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        select SEQ_ID_LINEA_SCRIPT.nextval INTO v_linea_script_id from dual;  
        
        insert into lineas_script
            values(v_linea_script_id, v_script_id, p_script(I).txt_linea);
    END LOOP;
    
    p_lista_scripts(4).tip_script := v_tipo_script;
    p_lista_scripts(4).nom_script := p_nom_fich_entrada || '.pdch';
    p_lista_scripts(4).cod_estado_scrip := v_cod_estado_script;
    p_lista_scripts(4).des_estado_scrip := v_des_estado_script;
    p_lista_scripts(4).num_orden := v_num_orden;
    p_lista_scripts(4).nom_script_lanza := v_script_lanza.nombre || '.pdch';
    p_lista_scripts(4).txt_script_lanza := v_script_lanza.txt;
    p_lista_scripts(4).nom_script_log := p_nom_fich_entrada || '.pdch.log';
    -- Crea las líneas para el script
    FOR I IN p_script.first .. p_script.last LOOP
        p_lista_scripts(4).txt_script(I).txt_linea := p_script(I).txt_linea; 
    END LOOP;
    
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_procesa_script: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_procesa_script;

  procedure p_procesa_type(p_script           IN t_t_linea,
                           p_cod_proyecto     IN VARCHAR2,
                           p_cod_sub_proy     IN VARCHAR2,
                           p_cod_peticion     IN VARCHAR2,
                           p_cod_demanda      IN VARCHAR2,
                           p_cod_usr          IN VARCHAR2,
                           p_cod_usr_peticion IN VARCHAR2,
                           p_nom_BBDD         IN VARCHAR2,
                           p_nom_esquema      IN VARCHAR2,
                           p_nom_fich_entrada IN VARCHAR2,
                           p_txt_ruta_entrada IN VARCHAR2,
                           p_txt_descripcion  IN VARCHAR2,
                           p_id_proceso       IN OUT NOCOPY NUMBER,
                           p_fec_proceso      OUT NOCOPY DATE,
                           p_cod_estado_proc  OUT NOCOPY NUMBER,
                           p_des_estado_proc  OUT NOCOPY VARCHAR2,
                           p_nom_script_lanza OUT NOCOPY VARCHAR2,
                           p_txt_script_lanza OUT NOCOPY t_t_linea, -- Modificado 18/10/2022 Cambio de tipo de dato
                           p_nom_script_log   OUT NOCOPY VARCHAR2,
                           p_lista_type       OUT NOCOPY t_t_type,
                           p_resultado        IN OUT NOCOPY INTEGER,
                           p_lista_errores    IN OUT NOCOPY t_t_error) AS
    v_sysdate DATE;
    v_mca_errores VARCHAR2(1);
    v_script_id NUMBER;
    v_linea_script_id NUMBER;
    v_tipo_script VARCHAR2(20);
    v_script_lanza t_r_script_lanza;
    v_num_orden NUMBER;
    v_cod_estado_script NUMBER;
    v_des_estado_script VARCHAR(20);
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    p_resultado := C_RESULTADO_OK;
	v_sysdate := SYSDATE;
    p_cod_estado_proc := 1;
    p_des_estado_proc := 'Generado';
    v_mca_errores := 'N';
    v_cod_estado_script := 1;
    v_des_estado_script := 'Pendiente';
    
    p_nom_script_lanza := v_script_lanza.nombre;
    
--    select SEQ_ID_SCRIPT.nextval INTO v_script_id from dual;
    v_script_lanza := create_script_lanza(p_nom_fich_entrada, p_txt_ruta_entrada, p_nom_esquema);
    
    -- Crea las líneas para el script
--    FOR I IN p_script.first .. p_script.last LOOP
--        select SEQ_ID_LINEA_SCRIPT.nextval INTO v_linea_script_id from dual;  
        
--        insert into lineas_script
--            values(v_linea_script_id, v_script_id, p_script(I).txt_linea);
--    END LOOP;
    
    p_nom_script_lanza := v_script_lanza.nombre;
    p_txt_script_lanza(1).txt_linea := v_script_lanza.txt;
    
    p_lista_type(1).num_orden_type := 1;
    p_lista_type(1).nom_objeto := 'Objeto 1';
    p_lista_type(1).script_type(1).nom_script := 'Objeto_1_Script_1';
    p_lista_type(1).script_type(1).tip_script := 'TYS';
    p_lista_type(1).script_type(2).nom_script := 'Objeto_1_Script_2';
    p_lista_type(1).script_type(2).tip_script := 'TYB';
    p_lista_type(1).script_type(3).nom_script := 'Objeto_1_Script_3';
    p_lista_type(1).script_type(3).tip_script := 'PDC';
    
    p_lista_type(2).num_orden_type := 2;
    p_lista_type(2).nom_objeto := 'Objeto 2';
    p_lista_type(2).script_type(1).nom_script := 'Objeto_2_Script_1';
    p_lista_type(2).script_type(1).tip_script := 'DROP';
    p_lista_type(2).script_type(2).nom_script := 'Objeto_2_Script_2';
    p_lista_type(2).script_type(2).tip_script := 'TYB';
    p_lista_type(2).script_type(3).nom_script := 'Objeto_2_Script_3';
    p_lista_type(2).script_type(3).tip_script := 'DROPS';
    
    p_lista_type(3).num_orden_type := 3;
    p_lista_type(3).nom_objeto := 'Objeto 3';
    p_lista_type(3).script_type(1).nom_script := 'Objeto_3_Script_1';
    p_lista_type(3).script_type(1).tip_script := 'TYS';
    p_lista_type(3).script_type(2).nom_script := 'Objeto_3_Script_2';
    p_lista_type(3).script_type(2).tip_script := 'TYB';
    p_lista_type(3).script_type(3).nom_script := 'Objeto_3_Script_3';
    p_lista_type(3).script_type(3).tip_script := 'PDC';
    
    p_lista_type(4).num_orden_type := 4;
    p_lista_type(4).nom_objeto := 'Objeto 4';
    p_lista_type(4).script_type(1).nom_script := 'Objeto_4_Script_1';
    p_lista_type(4).script_type(1).tip_script := 'DROP';
    p_lista_type(4).script_type(2).nom_script := 'Objeto_4_Script_2';
    p_lista_type(4).script_type(2).tip_script := 'TYB';
    p_lista_type(4).script_type(3).nom_script := 'Objeto_4_Script_3';
    p_lista_type(4).script_type(3).tip_script := 'DROPS';
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_procesa_type: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_procesa_type;

  procedure p_con_modelos(p_cod_proyecto  IN VARCHAR2,
                          p_nom_modelo    IN VARCHAR2,
                          p_cod_sub_proy  IN VARCHAR2, -- se añade p_
                          p_lista_modelos OUT NOCOPY t_t_modelo,
                          p_resultado     IN OUT NOCOPY INTEGER,
                          p_lista_errores IN OUT NOCOPY t_t_error) IS
    i INTEGER;
  BEGIN
    i := 0;
    p_resultado := C_RESULTADO_OK;
	
	for reg in (SELECT cod_proyecto,
                     nom_modelo,
                     nom_esquema,
                     nom_bbdd,
                     nom_carpeta_adj,
                     cod_capa_usrown,
                     mca_variables,
                     mca_grant_all,
                     mca_grant_public,
                     mca_inh,
                     obs_modelo,
                     mca_his,
                     mca_pdc
                FROM MODELO
               WHERE cod_proyecto = p_cod_proyecto
                 AND upper(nom_modelo) LIKE
                     '%' || upper(p_nom_modelo) || '%'
               ORDER BY nom_modelo) loop

        i := i + 1;

        p_lista_modelos(i).cod_proyecto := reg.cod_proyecto;
        p_lista_modelos(i).nom_modelo := reg.nom_modelo;
        p_lista_modelos(i).nom_esquema := reg.nom_esquema;
        p_lista_modelos(i).nom_bbdd := reg.nom_bbdd;
        p_lista_modelos(i).nom_carpeta_adj := reg.nom_carpeta_adj;
        p_lista_modelos(i).mca_variables := reg.mca_variables;
        p_lista_modelos(i).cod_capa_usrown := reg.cod_capa_usrown;  
        p_lista_modelos(i).mca_grant_all := reg.mca_grant_all;
        p_lista_modelos(i).mca_grant_public := reg.mca_grant_public;
        p_lista_modelos(i).mca_inh := reg.mca_inh;
        p_lista_modelos(i).obs_modelo := reg.obs_modelo;
        p_lista_modelos(i).mca_his := reg.mca_his;
        p_lista_modelos(i).mca_pdc := reg.mca_pdc;

        -- Para cada modelo, obtenemos la lista de submodelos, rellenando la estructura "hija" de submodelos

        select cod_sub_proy,
            des_sub_proy
        bulk collect
        into p_lista_modelos(i).lista_sub_proy
        from SUBPROYECTO
        where 
            cod_proyecto = p_lista_modelos(i).cod_proyecto
        order by 
            cod_sub_proy;

  end loop;	
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_modelos: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_modelos;

  procedure p_con_avisos_modelo(p_cod_proyecto  IN VARCHAR2,
                                p_lista_avisos  OUT NOCOPY t_t_aviso,
                                p_resultado     IN OUT NOCOPY INTEGER,
                                p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    SELECT 
        cod_nivel_aviso, des_nivel_aviso,
        cod_aviso, des_aviso, txt_aviso,
        cod_peticion, fec_alta, cod_usr_alta,
        mca_habilitado, fec_actu, cod_usr
    BULK COLLECT
    INTO p_lista_avisos
    FROM aviso
    WHERE
        cod_proyecto = p_cod_proyecto;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_avisos_modelo: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);    
  END p_con_avisos_modelo;

  procedure p_sel_procesados(p_cod_peticion     IN VARCHAR2,
                             p_cod_usr_peticion IN VARCHAR2,
                             p_fec_inicio       IN DATE,
                             p_fec_fin          IN DATE,
                             p_cod_usr          IN VARCHAR2,
                             p_cod_proyecto     IN VARCHAR2,
                             p_cod_sub_proy     IN VARCHAR2,
                             p_des_estado_proc  IN VARCHAR2,
                             p_ultimas          IN NUMBER,
                             p_lista_procesos   OUT NOCOPY t_t_proceso,
                             p_resultado        IN OUT NOCOPY INTEGER,
                             p_lista_errores    IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    SELECT 
        id_proceso, cod_peticion, cod_usr_peticion,
        fec_inicio, cod_usr, cod_estado_proc,
        des_estado_proc, mca_inicial, txt_descripcion,
        txt_obs_entrega, mca_errores
    BULK COLLECT
    INTO p_lista_procesos
    FROM proceso
    WHERE
        cod_proyecto = p_cod_proyecto;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_avisos_modelo: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);    
  END p_sel_procesados;

  procedure p_con_bbdd_modelo(p_cod_proyecto  IN VARCHAR2,
                              p_cod_sub_proy  IN VARCHAR2, -- Nuevo parámetro de entrada
                              p_lista_BBDD    OUT NOCOPY t_t_BBDD,
                              p_resultado     IN OUT NOCOPY INTEGER,
                              p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    SELECT 
        nom_bbdd, nom_esquema,
        nom_bbdd_his, nom_esquema_his,
        mca_defecto
    BULK COLLECT
    INTO p_lista_BBDD
    FROM BBDD
    WHERE
        cod_proyecto = p_cod_proyecto;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_bbdd_modelo: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);   
  END p_con_bbdd_modelo;

  procedure p_sel_historico(p_script        IN t_t_linea,
                            p_cod_proyecto  IN VARCHAR2,
                            p_lista_obj_his OUT NOCOPY t_t_obj_his,
                            p_resultado     IN OUT NOCOPY INTEGER,
                            p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    SELECT 
        nom_objeto, tip_objeto,
        mca_vig, mca_his
    BULK COLLECT
    INTO p_lista_obj_his
    FROM obj_his
    WHERE
        cod_proyecto = p_cod_proyecto;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_sel_historico: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200); 
  END p_sel_historico;

  procedure p_alta_historico(p_lista_objetos IN t_t_objetos,
                             p_cod_proyecto  IN VARCHAR2,
                             p_cod_peticion  IN VARCHAR2,
                             p_cod_usr       IN VARCHAR2,
                             p_resultado     IN OUT NOCOPY INTEGER,
                             p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_alta_historico: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_alta_historico;

  procedure p_con_pass_bbdd(p_nom_BBDD          IN VARCHAR2,
                            p_nom_esquema       IN VARCHAR2,
                            p_txt_clave_encript IN VARCHAR2,
                            p_txt_pwd           OUT NOCOPY VARCHAR2,
                            --p_txt_observacion   OUT NOCOPY VARCHAR2, -- Eliminado 07/09/2022 - No se necesita
                            --p_mca_habilitado    OUT NOCOPY VARCHAR2, -- Eliminado 07/09/2022 - No se necesita
                            p_resultado         IN OUT NOCOPY INTEGER,
                            p_lista_errores     IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
    select b.password into p_txt_pwd
    from bbdd b
    where b.nom_bbdd = p_nom_bbdd
    and b.nom_esquema = p_nom_esquema;
    
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_pass_bbdd: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_pass_bbdd;

  procedure p_registra_ejecucion(p_id_proceso       IN NUMBER,
                                 p_num_orden        IN NUMBER,
                                 p_cod_usr          IN VARCHAR2,
                                 p_log_script       IN t_t_linea,
                                 p_cod_estado_proc  OUT NOCOPY NUMBER,
                                 p_des_estado_proc  OUT NOCOPY VARCHAR2,
                                 p_nom_script       OUT NOCOPY VARCHAR2,
                                 p_cod_estado_scrip OUT NOCOPY NUMBER,
                                 p_des_estado_scrip OUT NOCOPY VARCHAR2,
                                 p_txt_cuadre_oper  OUT NOCOPY VARCHAR2,
                                 p_txt_cuadre_obj   OUT NOCOPY VARCHAR2,
                                 p_resultado        IN OUT NOCOPY INTEGER,
                                 p_lista_errores    IN OUT NOCOPY t_t_error) AS
    v_error_id NUMBER;
    v_sysdate DATE;
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    v_sysdate := SYSDATE;
    
    p_des_estado_scrip := 'Ejecutado';
    
    FOR I IN p_log_script.first .. p_log_script.last LOOP
        IF instr(p_log_script(I).txt_linea,'ERROR',1) > 0 THEN
            select SEQ_ERROR.nextval INTO v_error_id from dual;
            insert into errores values (v_error_id, p_id_proceso, p_num_orden, p_log_script(I+1).txt_linea, v_sysdate);
            p_des_estado_scrip := 'Error';
        END IF;
    END LOOP;

	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_registra_ejecucion: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_registra_ejecucion;

  procedure p_registra_ejecucion_parche(p_id_proceso       IN NUMBER,
                                        p_num_orden        IN NUMBER,
                                        p_cod_usr          IN VARCHAR2,
                                        p_log_script       IN t_t_linea,
                                        p_ind_repara       IN VARCHAR2,
                                        p_cod_estado_proc  OUT NOCOPY NUMBER,
                                        p_des_estado_proc  OUT NOCOPY VARCHAR2,
                                        p_nom_script       OUT NOCOPY VARCHAR2,
                                        p_cod_estado_scrip OUT NOCOPY NUMBER,
                                        p_des_estado_scrip OUT NOCOPY VARCHAR2,
                                        p_txt_cuadre_oper  OUT NOCOPY VARCHAR2,
                                        p_txt_cuadre_obj   OUT NOCOPY VARCHAR2,
                                        p_resultado        IN OUT NOCOPY INTEGER,
                                        p_lista_errores    IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_registra_ejecucion_parche: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_registra_ejecucion_parche;

  procedure p_registra_ejecucion_type(p_id_proceso      IN NUMBER,
                                      p_cod_usr         IN VARCHAR2,
                                      p_log_script      IN t_t_linea,
                                      p_cod_estado_proc OUT NOCOPY NUMBER,
                                      p_des_estado_proc OUT NOCOPY VARCHAR2,
                                      p_lista_type      OUT NOCOPY t_t_type,
                                      p_resultado       IN OUT NOCOPY INTEGER,
                                      p_lista_errores   IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_registra_ejecucion_type: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_registra_ejecucion_type;

  procedure p_con_procesado(p_id_proceso        IN NUMBER,
                            p_nom_modelo        OUT NOCOPY VARCHAR2,
                            p_cod_usr_peticion  OUT NOCOPY VARCHAR2,
                            p_nom_bbdd_his      OUT NOCOPY VARCHAR2,
                            p_des_sub_proy      OUT NOCOPY VARCHAR2,
                            p_nom_esquema       OUT NOCOPY VARCHAR2,
                            p_nom_esquema_his   OUT NOCOPY VARCHAR2,
                            p_cod_peticion      OUT NOCOPY VARCHAR2,
                            p_nom_bbdd          OUT NOCOPY VARCHAR2,
                            p_cod_estado_proc   OUT NOCOPY NUMBER,
                            p_des_estado_proc   OUT NOCOPY VARCHAR2,
                            p_cod_usr           OUT NOCOPY VARCHAR2,
                            p_fec_proceso       OUT NOCOPY DATE,
                            p_txt_comentario    OUT NOCOPY VARCHAR2,
                            p_mca_inicial       OUT NOCOPY VARCHAR2,
                            p_txt_ruta_entrada  OUT NOCOPY VARCHAR2,
                            p_lista_script_ejec OUT NOCOPY t_t_script_ejec,
                            p_resultado         IN OUT NOCOPY INTEGER,
                            p_lista_errores     IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    for reg_proceso in 
        (SELECT cod_proyecto, cod_peticion,
            cod_usr_peticion, fec_inicio,
            cod_usr, cod_estado_proc,
            des_estado_proc, mca_inicial,
            txt_descripcion
        FROM PROCESO
        WHERE id_proceso = p_id_proceso) loop

        for reg_modelo in 
            (SELECT nom_modelo, nom_bbdd
            FROM modelo
            where cod_proyecto = reg_proceso.cod_proyecto) loop
            
            p_nom_modelo := reg_modelo.nom_modelo;
            p_nom_bbdd := reg_modelo.nom_bbdd;
        
        end loop;
        
        for reg_bbdd in 
            (SELECT nom_esquema, nom_bbdd_his, nom_esquema_his
            FROM bbdd
            WHERE cod_proyecto = reg_proceso.cod_proyecto) loop
        
            p_nom_esquema := reg_bbdd.nom_esquema;
            p_nom_bbdd_his := reg_bbdd.nom_bbdd_his;
            p_nom_esquema_his := reg_bbdd.nom_esquema_his;
            
        end loop;
        
        for reg_subproyecto in 
            (SELECT des_sub_proy
            FROM subproyecto
            WHERE cod_proyecto = reg_proceso.cod_proyecto) loop
        
            p_des_sub_proy := reg_subproyecto.des_sub_proy;
            
        end loop;
        
        p_cod_usr_peticion := reg_proceso.cod_usr_peticion;
        p_cod_peticion := reg_proceso.cod_peticion;
        p_cod_estado_proc := reg_proceso.cod_estado_proc;
        p_des_estado_proc := reg_proceso.des_estado_proc;
        p_cod_usr := reg_proceso.cod_usr;
        p_fec_proceso := reg_proceso.fec_inicio;
        p_txt_comentario := reg_proceso.txt_descripcion;
        p_mca_inicial := reg_proceso.mca_inicial;
        
        for reg_script in 
            (SELECT nombre, ruta
            FROM script
            WHERE id_proceso = p_id_proceso
            AND tipo = 'SQL') loop
        
            p_txt_ruta_entrada := reg_script.ruta;
            
        end loop;
                        
    end loop;	
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_procesado: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200); 
  END p_con_procesado;

  procedure p_con_cuadre_oper_script(p_id_proceso    IN NUMBER,
                                     p_num_orden     IN NUMBER,
                                     p_cuadre_oper   OUT NOCOPY t_t_cuadre_oper,
                                     p_resultado     IN OUT NOCOPY INTEGER,
                                     p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_cuadre_oper_script: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_cuadre_oper_script;

  procedure p_con_cuadre_obj_script(p_id_proceso    IN NUMBER,
                                    p_num_orden     IN NUMBER,
                                    p_cuadre_obj    OUT NOCOPY t_t_cuadre_obj,
                                    p_resultado     IN OUT NOCOPY INTEGER,
                                    p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_cuadre_obj_script: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_cuadre_obj_script;

  procedure p_con_ruta_entrega(p_cod_proyecto     IN VARCHAR2,
                               p_id_proceso       IN NUMBER,
                               p_txt_ruta_entrega OUT NOCOPY VARCHAR2,
                               p_nom_fichero_vig  OUT NOCOPY VARCHAR2,
                               p_nom_fichero_his  OUT NOCOPY VARCHAR2,
                               p_nom_fichero_typ  OUT NOCOPY VARCHAR2,
                               p_resultado        IN OUT NOCOPY INTEGER,
                               p_lista_errores    IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    p_txt_ruta_entrega := '/home/federico/tmp';
    p_nom_fichero_vig := 'entrega.zip';
    p_nom_fichero_his := 'entrega-historico.zip';
    p_nom_fichero_typ := 'entrega-tipo.zip';
    
    EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_ruta_entrega: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_ruta_entrega;

  procedure p_entregar_peticion(p_id_proceso      IN NUMBER,
                                p_cod_usr         IN VARCHAR2,
                                p_txt_comentario  IN VARCHAR2,
                                p_des_estado_proc OUT NOCOPY VARCHAR2,
                                p_resultado       IN OUT NOCOPY INTEGER,
                                p_lista_errores   IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    update proceso
    set des_estado_proc = 'Entregado', txt_obs_entrega = p_txt_comentario
    where id_proceso = p_id_proceso;
    
    p_des_estado_proc := 'Entregado';
    
    EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_entregar_peticion: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_entregar_peticion;

  procedure p_con_errores_script(p_id_proceso           IN NUMBER,
                                 p_num_orden            IN NUMBER,
                                 p_lista_errores_script OUT NOCOPY t_t_error_script,
                                 p_lista_parches        OUT NOCOPY t_t_script_parche,
                                 p_resultado            IN OUT NOCOPY INTEGER,
                                 p_lista_errores        IN OUT NOCOPY t_t_error) AS
    i INTEGER;
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    i := 0;
    
    for reg_error in 
        (SELECT id_proceso, fecha_error, num_orden, error
        FROM ERRORES
        WHERE id_proceso = p_id_proceso
        and num_orden = p_num_orden) loop
    
        i := i + 1;
        p_lista_errores_script(i).id_proceso := reg_error.id_proceso;
        p_lista_errores_script(i).fec_error := reg_error.fecha_error;
        p_lista_errores_script(i).num_orden := reg_error.num_orden;
        p_lista_errores_script(i).txt_error := reg_error.error;
        
    end loop;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_errores_script: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_errores_script;

  procedure p_con_errores_type(p_id_proceso         IN NUMBER,
                               p_num_orden          IN NUMBER,
                               p_lista_errores_type OUT NOCOPY t_t_error_script,
                               p_resultado          IN OUT NOCOPY INTEGER,
                               p_lista_errores      IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_errores_type: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_errores_type;

  procedure p_rechazar_procesado(p_id_proceso     IN NUMBER,
                                 p_txt_comentario IN VARCHAR2,
                                 p_cod_usr        IN VARCHAR2,
                                 p_resultado      IN OUT NOCOPY INTEGER,
                                 p_lista_errores  IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    update proceso
    set 
        des_estado_proc = 'Rechazado',
        txt_obs_entrega = p_txt_comentario
    where
        id_proceso = p_id_proceso;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_rechazar_procesado: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_rechazar_procesado;

  procedure p_repara_script(p_id_proceso        IN NUMBER,
                            p_num_orden         IN NUMBER,
                            p_cod_usr           IN VARCHAR2,
                            p_mca_reprocesa     IN VARCHAR2,
                            p_mca_mismo_script  IN VARCHAR2,
                            p_nom_script_new    IN VARCHAR2,
                            p_txt_ruta_new      IN VARCHAR2,
                            p_script_new        IN t_t_linea,
                            p_txt_comentario    IN VARCHAR2,
                            p_nom_script_parche IN VARCHAR2,
                            p_txt_ruta_parche   IN VARCHAR2,
                            p_script_parche     IN t_t_linea,
                            p_nom_bbdd          IN VARCHAR2, -- Añadido 16/11/2022, dato del procesado en curso
                            p_nom_esquema       IN VARCHAR2, -- Añadido 16/11/2022, dato del procesado en curso
                            p_mca_HIS           IN VARCHAR2, -- Añadido 16/11/2022, dato del procesado en curso
                            p_nom_bbdd_his      IN VARCHAR2, -- Añadido 16/11/2022, dato del procesado en curso
                            p_nom_esquema_his   IN VARCHAR2, -- Añadido 16/11/2022,  dato del procesado en curso
                            p_lista_obj_his     IN t_t_obj_his, -- Añadido 16/11/2022, relleno si se ha pasado por Seleccion Histórico.
                            p_nom_script_repara OUT NOCOPY VARCHAR2,
                            p_script_repara     OUT NOCOPY t_t_linea,
                            p_nom_script_lanza  OUT NOCOPY VARCHAR2,
                            p_script_lanza      OUT NOCOPY t_t_linea,
                            p_nom_log_repara    OUT NOCOPY VARCHAR2,
                            p_lista_script_old  OUT NOCOPY t_t_script_old,
                            p_lista_script      OUT NOCOPY t_t_script,
                            p_resultado         IN OUT NOCOPY INTEGER,
                            p_lista_errores     IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_repara_script: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_repara_script;

  procedure p_descartar_script(p_script            IN t_t_linea,
                               p_id_proceso        IN NUMBER,
                               p_cod_usr           IN VARCHAR2,
                               p_nom_script        IN VARCHAR2,
                               p_tip_cambio        IN VARCHAR2,
                               p_nom_script_new    IN VARCHAR2,
                               p_txt_ruta_new      IN VARCHAR2,
                               p_txt_comentario    IN VARCHAR2,
                               p_nom_script_parche IN VARCHAR2,
                               p_txt_ruta_parche   IN VARCHAR2,
                               p_script_parche     IN t_t_linea,
                               p_lista_parches     OUT NOCOPY t_t_script,
                               p_lista_script_old  OUT NOCOPY t_t_script_old,
                               p_lista_script_new  OUT NOCOPY t_t_script,
                               p_cod_estado_proc   OUT NOCOPY NUMBER,
                               p_des_estado_proc   OUT NOCOPY VARCHAR2,
                               p_resultado         IN OUT NOCOPY INTEGER,
                               p_lista_errores     IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_descartar_script: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_descartar_script;

  procedure p_excepcion_script(p_id_proceso        IN NUMBER,
                               p_num_orden         IN NUMBER, -- Añadido 07/09/2022. Aparecía en la cabecera pero faltaba aquí
                               p_txt_comentario    IN VARCHAR2,
                               p_cod_usr           IN VARCHAR2,
                               p_cod_estado_proc   OUT NOCOPY NUMBER,
                               p_des_estado_proc   OUT NOCOPY VARCHAR2,
                               p_cod_estado_script OUT NOCOPY NUMBER,
                               p_des_estado_script OUT NOCOPY VARCHAR2,
                               p_resultado         IN OUT NOCOPY INTEGER,
                               p_lista_errores     IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
    
    update script
    set des_estado = 'Excepción', txt_comentario = p_txt_comentario
    where id_proceso = p_id_proceso;
    
    p_des_estado_script := 'Excepción';
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_excepcion_script: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_excepcion_script;

  procedure p_detalle_objetos_scripts(p_id_proceso        IN NUMBER,
                                      p_num_orden         IN NUMBER,
                                      p_lista_det_objetos OUT NOCOPY t_t_det_objeto,
                                      p_resultado         IN OUT NOCOPY INTEGER,
                                      p_lista_errores     IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_detalle_objetos_scripts: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_detalle_objetos_scripts;
  
  procedure p_con_historico_objeto(p_cod_proyecto     IN VARCHAR2,
                                   p_nom_objeto_padre IN VARCHAR2,
                                   p_tip_objeto_padre IN VARCHAR2,
                                   p_tip_accion_padre IN VARCHAR2,
                                   p_nom_objeto       IN VARCHAR2,
                                   p_tip_objeto       IN VARCHAR2,
                                   p_tip_accion       IN VARCHAR2,
                                   p_fec_desde        IN DATE,
                                   p_fec_hasta        IN DATE,
                                   p_cod_estado_proc  IN NUMBER,
                                   p_cod_estado_scrip IN NUMBER,
                                   p_lista_his_proc   OUT NOCOPY t_t_his_proc,
                                   p_resultado        IN OUT NOCOPY INTEGER,
                                   p_lista_errores    IN OUT NOCOPY t_t_error) AS
    BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_historico_objeto: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_historico_objeto;
  
    procedure p_con_tipos_objeto(p_lista_tip_objeto OUT NOCOPY t_t_tip_objeto,
                               p_resultado        IN OUT NOCOPY INTEGER,
                               p_lista_errores    IN OUT NOCOPY t_t_error) AS
    BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_tipos_objeto: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_tipos_objeto;
  
  procedure p_con_estados_proc(p_lista_estados OUT NOCOPY t_t_estado,
                               p_resultado     IN OUT NOCOPY INTEGER,
                               p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_estados_proc: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_estados_proc;
  
  procedure p_con_estados_scrip(p_lista_estados OUT NOCOPY t_t_estado,
                                p_resultado     IN OUT NOCOPY INTEGER,
                                p_lista_errores IN OUT NOCOPY t_t_error) AS
  
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_estados_scrip: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_estados_scrip;
  
  procedure p_con_operaciones(p_lista_operacion OUT NOCOPY t_t_operacion,
                              p_resultado       IN OUT NOCOPY INTEGER,
                              p_lista_errores   IN OUT NOCOPY t_t_error) AS
    BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_con_operaciones: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_con_operaciones;
  
  procedure p_informe_cambios(p_cod_proyecto  IN VARCHAR2,
                              p_fec_desde     IN DATE,
                              p_fec_hasta     IN DATE,
                              p_lista_cambios OUT NOCOPY t_t_informe_cambios,
                              p_resultado     IN OUT NOCOPY INTEGER,
                              p_lista_errores IN OUT NOCOPY t_t_error) AS
     BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_informe_cambios: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_informe_cambios;
  
  procedure p_log_ejecucion(p_id_proceso    IN NUMBER,
                            p_num_orden     IN NUMBER, -- viene de una pantalla anterior: Ejecutar Scripts. Es el num_orden del script seleccionado
                            p_lista_log     OUT NOCOPY t_t_log_ejecucion,
                            p_resultado     IN OUT NOCOPY INTEGER,
                            p_lista_errores IN OUT NOCOPY t_t_error) AS
    BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_log_ejecucion: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_log_ejecucion;
  
  procedure p_elimina_log(p_id_proceso     IN NUMBER,
                          p_num_orden      IN NUMBER,
                          p_num_iteracion  IN NUMBER,
                          p_num_ejecucion  IN NUMBER,
                          p_num_parche     IN NUMBER,
                          p_num_sentencia  IN NUMBER,
                          p_txt_comentario IN VARCHAR2,
                          p_resultado      IN OUT NOCOPY INTEGER,
                          p_lista_errores  IN OUT NOCOPY t_t_error) AS
    BEGIN
    p_resultado := C_RESULTADO_OK;
	
	EXCEPTION
		WHEN OTHERS THEN
	    	p_resultado := C_RESULTADO_NOK;

			p_lista_errores(1).txt_error := substr('p_elimina_log: ' ||
	                                             sqlerrm,
	                                             1,
	                                             200);
  END p_elimina_log;
  
END SM2_K_LD_MDSQL;

/
