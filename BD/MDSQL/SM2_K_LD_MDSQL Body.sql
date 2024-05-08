--------------------------------------------------------
-- Archivo creado  - jueves-septiembre-22-2022   
--------------------------------------------------------
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
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_procesa_script
    NULL;
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
                           p_txt_script_lanza OUT NOCOPY VARCHAR2,
                           p_nom_script_log   OUT NOCOPY VARCHAR2,
                           p_lista_type       OUT NOCOPY t_t_type,
                           p_resultado        IN OUT NOCOPY INTEGER,
                           p_lista_errores    IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_procesa_type
    NULL;
  END p_procesa_type;

  procedure p_con_modelos(p_cod_proyecto  IN VARCHAR2,
                          p_nom_modelo    IN VARCHAR2,
                          p_cod_sub_proy  IN VARCHAR2, -- se añade p_
                          p_lista_modelos OUT NOCOPY t_t_modelo,
                          p_resultado     IN OUT NOCOPY INTEGER,
                          p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    p_resultado := C_RESULTADO_OK;
	
		
	
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_avisos_modelo
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_sel_procesados
    NULL;
  END p_sel_procesados;

  procedure p_con_bbdd_modelo(p_cod_proyecto  IN VARCHAR2,
                              p_cod_sub_proy  IN VARCHAR2, -- Nuevo parámetro de entrada
                              p_lista_BBDD    OUT NOCOPY t_t_BBDD,
                              p_resultado     IN OUT NOCOPY INTEGER,
                              p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_bbdd_modelo
    NULL;
  END p_con_bbdd_modelo;

  procedure p_sel_historico(p_script        IN t_t_linea,
                            p_cod_proyecto  IN VARCHAR2,
                            p_lista_obj_his OUT NOCOPY t_t_obj_his,
                            p_resultado     IN OUT NOCOPY INTEGER,
                            p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_sel_historico
    NULL;
  END p_sel_historico;

  procedure p_alta_historico(p_lista_objetos IN t_t_objetos,
                             p_cod_proyecto  IN VARCHAR2,
                             p_cod_peticion  IN VARCHAR2,
                             p_cod_usr       IN VARCHAR2,
                             p_resultado     IN OUT NOCOPY INTEGER,
                             p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_alta_historico
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_pass_bbdd
    NULL;
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
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_registra_ejecucion
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_registra_ejecucion_parche
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_registra_ejecucion_type
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_procesado
    NULL;
  END p_con_procesado;

  procedure p_con_cuadre_oper_script(p_id_proceso    IN NUMBER,
                                     p_num_orden     IN NUMBER,
                                     p_cuadre_oper   OUT NOCOPY t_t_cuadre_oper,
                                     p_resultado     IN OUT NOCOPY INTEGER,
                                     p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_cuadre_oper_script
    NULL;
  END p_con_cuadre_oper_script;

  procedure p_con_cuadre_obj_script(p_id_proceso    IN NUMBER,
                                    p_num_orden     IN NUMBER,
                                    p_cuadre_obj    OUT NOCOPY t_t_cuadre_obj,
                                    p_resultado     IN OUT NOCOPY INTEGER,
                                    p_lista_errores IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_cuadre_obj_script
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_ruta_entrega
    NULL;
  END p_con_ruta_entrega;

  procedure p_entregar_peticion(p_id_proceso      IN NUMBER,
                                p_cod_usr         IN VARCHAR2,
                                p_txt_comentario  IN VARCHAR2,
                                p_des_estado_proc OUT NOCOPY VARCHAR2,
                                p_resultado       IN OUT NOCOPY INTEGER,
                                p_lista_errores   IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_entregar_peticion
    NULL;
  END p_entregar_peticion;

  procedure p_con_errores_script(p_id_proceso           IN NUMBER,
                                 p_num_orden            IN NUMBER,
                                 p_lista_errores_script OUT NOCOPY t_t_error_script,
                                 p_lista_parches        OUT NOCOPY t_t_script_parche,
                                 p_resultado            IN OUT NOCOPY INTEGER,
                                 p_lista_errores        IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_errores_script
    NULL;
  END p_con_errores_script;

  procedure p_con_errores_type(p_id_proceso         IN NUMBER,
                               p_num_orden          IN NUMBER,
                               p_lista_errores_type OUT NOCOPY t_t_error_script,
                               p_resultado          IN OUT NOCOPY INTEGER,
                               p_lista_errores      IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_con_errores_type
    NULL;
  END p_con_errores_type;

  procedure p_rechazar_procesado(p_id_proceso     IN NUMBER,
                                 p_txt_comentario IN VARCHAR2,
                                 p_cod_usr        IN VARCHAR2,
                                 p_resultado      IN OUT NOCOPY INTEGER,
                                 p_lista_errores  IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_rechazar_procesado
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_repara_script
    NULL;
  END p_repara_script;

  procedure p_descartar_script(p_script            IN t_t_script,
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_descartar_script
    NULL;
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
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_excepcion_script
    NULL;
  END p_excepcion_script;

  procedure p_detalle_objetos_scripts(p_id_proceso        IN NUMBER,
                                      p_num_orden         IN NUMBER,
                                      p_lista_det_objetos OUT NOCOPY t_t_det_objeto,
                                      p_resultado         IN OUT NOCOPY INTEGER,
                                      p_lista_errores     IN OUT NOCOPY t_t_error) AS
  BEGIN
    -- TAREA: Se necesita implantación para procedure SM2_K_LD_MDSQL.p_detalle_objetos_scripts
    NULL;
  END p_detalle_objetos_scripts;

END SM2_K_LD_MDSQL;

/
