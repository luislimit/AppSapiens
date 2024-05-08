CREATE OR REPLACE PACKAGE sm2_k_ld_MDSQL IS

  /**---------------------------------------------------------------------------------------------------
  || Paquete que se utiliza para la generaci�n y ejecuci�n de scripts
  */ ---------------------------------------------------------------------------------------------------
  ------------------
  -- Constantes
  ------------------
  C_RESULTADO_OK    CONSTANT NUMBER(1) := 1;
  C_RESULTADO_NOK   CONSTANT NUMBER(1) := 0;
  C_RESULTADO_AVISO CONSTANT NUMBER(1) := 2;

  -----------------------------------------
  -- Colecciones para intercambio con Java
  ------------------------------------------
  -- L�nea de un script
  TYPE t_r_linea IS RECORD(
    txt_linea VARCHAR2(32000));

  -- Lista de l�neas de un script
  TYPE t_t_linea IS TABLE OF t_r_linea INDEX BY BINARY_INTEGER;

  -- Texto de Error
  TYPE t_r_error IS RECORD(
    txt_error VARCHAR2(500));

  -- Lista de Errores
  TYPE t_t_error IS TABLE OF t_r_error INDEX BY BINARY_INTEGER;

  -- Tipo de dato
  TYPE t_r_tipo_dato IS RECORD(
    tip_dato VARCHAR2(30));

  -- Lista de tipos de dato  
  TYPE t_t_tipo_dato IS TABLE OF t_r_tipo_dato INDEX BY BINARY_INTEGER;

  -- Submodelos
  TYPE t_r_subproyecto IS RECORD(
    cod_sub_proy VARCHAR2(30),
    des_sub_proy VARCHAR2(150));

  -- Lista de Submodelos 
  TYPE t_t_subproyecto IS TABLE OF t_r_subproyecto INDEX BY BINARY_INTEGER;

  -- Datos de un modelo
  TYPE t_r_modelo IS RECORD(
    cod_proyecto     VARCHAR2(30),
    nom_modelo       VARCHAR2(100),
    nom_esquema      VARCHAR2(30),
    nom_bbdd         VARCHAR2(30),
    nom_carpeta_adj  VARCHAR2(100),
    cod_capa_usrown  VARCHAR2(10), -- Valores S � N
    mca_variables    VARCHAR2(1), -- Valores S � N 
    mca_grant_all    VARCHAR2(1), -- Valores S � N
    mca_grant_public VARCHAR2(1), -- Valores S � N
    mca_inh          VARCHAR2(1), -- Valores S � N
    obs_modelo       VARCHAR2(200),
    mca_pdc          VARCHAR2(1), -- Valores S � N
    mca_his          VARCHAR2(1), -- Valores S � N  
    lista_sub_proy   t_t_subproyecto);

  -- Lista de Modelos
  TYPE t_t_modelo IS TABLE OF t_r_modelo INDEX BY BINARY_INTEGER;

  /*
  Estados de un script
  1 Pendiente
  2 Ejecutado
  3 Error
  4 Descuadrado
  5 Reparado
  6 Descartado
  7 Excepci�n
  */

  -- Datos de un script
  TYPE t_r_script IS RECORD(
    tip_script       VARCHAR2(5), -- Los tipos posibles ser�n SQL - Script SQL Modificado, PDC - Script PDC Modificado, SQLH - Script SQL Hist�rico, PDCH - Script PDC Hist�rico 
    txt_script       t_t_linea,
    nom_script       VARCHAR2(100),
    cod_estado_scrip NUMBER(1), -- Modificado 26/08/2022 de VARCHAR2 a NUMBER
    des_estado_scrip VARCHAR2(20),
    num_orden        NUMBER,
    nom_script_lanza VARCHAR2(106),
    txt_script_lanza VARCHAR2(32767),
    nom_script_log   VARCHAR2(100));

  -- Lista de scripts
  TYPE t_t_script IS TABLE OF t_r_script INDEX BY BINARY_INTEGER;

  -- Renombrado de scripts
  TYPE t_r_script_old IS RECORD(
    nom_script_old VARCHAR2(100),
    nom_script_new VARCHAR2(100));

  -- Lista de scripts renombrados
  TYPE t_t_script_old IS TABLE OF t_r_script_old INDEX BY BINARY_INTEGER;

  -- Script ejecutado
  TYPE t_r_script_ejec IS RECORD(
    num_orden        NUMBER,
    cod_estado_scrip NUMBER(1), -- Modificado 26/08/2022 de VARCHAR2 a NUMBER
    des_estado_scrip VARCHAR2(20),
    fec_ejec         DATE,
    txt_cuadre_oper  VARCHAR2(12),
    txt_cuadre_obj   VARCHAR2(12),
    nom_script       VARCHAR2(100),
    mca_errores      VARCHAR2(1)); -- Valores S � N

  -- Lista de scripts ejecutados
  TYPE t_t_script_ejec IS TABLE OF t_r_script_ejec INDEX BY BINARY_INTEGER;

  -- Script de objetos TYPE
  TYPE t_r_script_type IS RECORD(
    txt_script t_t_linea,
    nom_script VARCHAR2(100),
    tip_script VARCHAR2(5)); -- A�adido el 18/10/2022

  -- Tipos de scripts TYPE
  -- TYS - Especificaci�n
  -- TYB - Body
  -- PDC - PDC
  -- DROP - Borrado -- En pantalla se muestra en el �rea TYS
  -- DROPS - PDC de borrado -- En pantalla se muestra en el �rea PDC  

  -- Lista de scripts de objetos TYPE
  TYPE t_t_script_type IS TABLE OF t_r_script_type INDEX BY BINARY_INTEGER;

  -- Datos de un objeto Type procesado
  TYPE t_r_type IS RECORD(
    num_orden_type   NUMBER,
    cod_estado_scrip NUMBER(1),
    des_estado_scrip VARCHAR2(20),
    fec_cambio       DATE,
    num_ejecucion    NUMBER,
    txt_cuadre_TYS   VARCHAR2(10),
    txt_cuadre_TYB   VARCHAR2(10),
    txt_cuadre_PDC   VARCHAR2(10),
    txt_cuadre_DROP  VARCHAR2(10),
    nom_objeto       VARCHAR2(100), -- Ampliado tama�o 18/10/2022
    script_type      t_t_script_type);
  --nom_script_lanza VARCHAR2(106),   -- Eliminado 05/10/2022
  --txt_script_lanza t_t_linea,       -- Eliminado 05/10/2022
  --nom_script_log   VARCHAR2(100));  -- Eliminado 05/10/2022

  -- Lista de objetos Type procesados
  TYPE t_t_type IS TABLE OF t_r_type INDEX BY BINARY_INTEGER;

  -- Objeto con hist�rico
  TYPE t_r_obj_his IS RECORD(
    nom_objeto VARCHAR2(30),
    tip_objeto VARCHAR2(20), -- Modificado tama�o 26/08/2022
    --des_tip_objeto VARCHAR2(30), -- Eliminado 26/08/2022
    mca_vig VARCHAR2(1), -- A�adido 26/08/2022. Valores S � N. Valor check Vigente de la pantalla Seleccion Hist�rico - Debe ir relleno para la invocacion a p_procesa_script
    mca_his VARCHAR2(1)); -- Valores S � N - Valor check Hist�rico de la pantalla Seleccion Hist�rico

  -- Lista de Objetos con hist�rico
  TYPE t_t_obj_his IS TABLE OF t_r_obj_his INDEX BY BINARY_INTEGER;

  -- Objeto con su tipo
  TYPE t_r_objetos IS RECORD(
    tip_objeto VARCHAR2(20), -- Modificado tama�o 26/08/2022
    nom_objeto VARCHAR2(30));

  -- Lista de objetos con su tipo
  TYPE t_t_objetos IS TABLE OF t_r_objetos INDEX BY BINARY_INTEGER;

  /* Niveles de aviso (notas del modelo)
   1 Cr�tica
   2 Alta
   3 Media
   4 Baja
  */

  -- Aviso (nota) de un modelo 
  TYPE t_r_aviso IS RECORD(
    cod_nivel_aviso NUMBER(1),
    des_nivel_aviso VARCHAR2(7),
    cod_aviso       NUMBER, -- C�digo de aviso (interno)
    des_aviso       VARCHAR2(100), -- T�tulo
    txt_aviso       VARCHAR2(500), -- Descripci�n
    cod_peticion    VARCHAR2(25),
    fec_alta        DATE,
    cod_usr_alta    VARCHAR2(8),
    mca_habilitado  VARCHAR2(1), -- Valores S � N
    fec_actu        DATE,
    cod_usr         VARCHAR2(8));

  -- Lista de avisos de un modelo
  TYPE t_t_aviso IS TABLE OF t_r_aviso INDEX BY BINARY_INTEGER;

  /*
  Estados de un procesado
  1 Generado
  2 En ejecuci�n
  3 Error
  4 Ejecutado
  5 Rechazado
  6 Entregado 
  */
  -- Datos de un procesado
  TYPE t_r_proceso IS RECORD(
    id_proceso       NUMBER,
    cod_peticion     VARCHAR2(25),
    cod_usr_peticion VARCHAR2(8), -- En pantalla figura como "Solicitado"
    fec_inicio       DATE,
    cod_usr          VARCHAR2(8),
    cod_estado_proc  NUMBER(1),
    des_estado_proc  VARCHAR2(20),
    mca_inicial      VARCHAR2(1),
    txt_descripcion  VARCHAR2(500),
    txt_obs_entrega  VARCHAR2(500),
    mca_errores      VARCHAR2(1)); -- Valores S � N  

  -- Lista de procesados
  TYPE t_t_proceso IS TABLE OF t_r_proceso INDEX BY BINARY_INTEGER;

  -- Base de datos
  TYPE t_r_BBDD IS RECORD(
    nom_BBDD        VARCHAR2(30),
    nom_esquema     VARCHAR2(30),
    nom_BBDD_his    VARCHAR2(30),
    nom_esquema_his VARCHAR2(30),
    mca_defecto     VARCHAR2(1)); -- Valores S � N  

  -- Lista de bases de datos
  TYPE t_t_BBDD IS TABLE OF t_r_BBDD INDEX BY BINARY_INTEGER;

  -- Cuadre de operaciones para un tipo de objeto
  TYPE t_r_cuadre_oper IS RECORD(
    tip_objeto VARCHAR2(20), -- Modificado tama�o 26/08/2022
    --des_tip_objeto  VARCHAR2(30), -- Eliminado 26/08/2022
    tip_accion      VARCHAR2(2),
    num_oper_bbdd   NUMBER, -- Operaciones del log
    num_oper_script NUMBER); -- Operaciones del script

  -- Listado de cuadres de operaciones por tipo de objeto 
  TYPE t_t_cuadre_oper IS TABLE OF t_r_cuadre_oper INDEX BY BINARY_INTEGER;

  -- Cuadre de operaciones para un objeto
  TYPE t_r_cuadre_obj IS RECORD(
    nom_objeto VARCHAR2(30),
    tip_objeto VARCHAR2(20), -- Modificado tama�o 26/08/2022
    --des_tip_objeto  VARCHAR2(30), -- Eliminado 26/08/2022
    tip_accion      VARCHAR2(2),
    num_oper_bbdd   NUMBER,
    num_oper_script NUMBER);

  -- Listado de cuadres de operaciones por objeto 
  TYPE t_t_cuadre_obj IS TABLE OF t_r_cuadre_obj INDEX BY BINARY_INTEGER;

  -- Error en un script
  TYPE t_r_error_script IS RECORD(
    num_orden     NUMBER,
    fec_error     DATE,
    id_proceso    NUMBER,
    num_iteracion NUMBER,
    num_ejecucion NUMBER,
    nom_script    VARCHAR2(100),
    num_sentencia NUMBER,
    txt_error     VARCHAR2(200));

  -- Lista de errores de scripts
  TYPE t_t_error_script IS TABLE OF t_r_error_script INDEX BY BINARY_INTEGER;

  /*
  Estados de ejecuci�n
  1 Pendiente
  2 Ejecutado
  3 Error
  */
  -- Datos de un script tipo parche (ya ejecutado)
  TYPE t_r_script_parche IS RECORD(
    num_orden       NUMBER,
    cod_estado_ejec NUMBER(1),
    des_estado_ejec VARCHAR2(20),
    fec_script      DATE,
    id_proceso      NUMBER,
    num_iteracion   NUMBER,
    num_ejecucion   NUMBER,
    nom_script      VARCHAR2(100),
    txt_comentario  VARCHAR2(200));

  -- Lista de scripts parche
  TYPE t_t_script_parche IS TABLE OF t_r_script_parche INDEX BY BINARY_INTEGER;

  -- Datos de un objeto modificado un script
  TYPE t_r_det_objeto IS RECORD(
    num_sentencia NUMBER,
    nom_obj_padre VARCHAR2(30),
    tip_obj_padre VARCHAR2(20), -- Modificado tama�o 26/08/2022
    --des_tip_obj_padre VARCHAR2(30), -- Eliminado 26/08/2022
    tip_accion_padre VARCHAR2(2),
    nom_objeto       VARCHAR2(30),
    nom_objeto_dest  VARCHAR2(30), -- A�adido 05/10/2022 - Objeto destino. Debe salir en pantalla
    tip_objeto       VARCHAR2(20), -- Modificado tama�o 26/08/2022
    --des_tip_objeto    VARCHAR2(30), -- Eliminado 26/08/2022
    tip_accion   VARCHAR2(2),
    tip_dato     VARCHAR2(18),
    num_longitud NUMBER, -- Precisi�n
    num_decimal  NUMBER); -- Escala

  -- Listado de objetos modificados en un script
  TYPE t_t_det_objeto IS TABLE OF t_r_det_objeto INDEX BY BINARY_INTEGER;

  TYPE t_r_his_proc IS RECORD(
    cod_peticion     VARCHAR2(25),
    des_estado_proc  VARCHAR2(20),
    fec_proceso      DATE,
    cod_sub_proy     VARCHAR2(30),
    cod_usr_peticion VARCHAR2(8), -- Solicitado
    cod_usr          VARCHAR2(8), -- Usuario
    tip_accion       VARCHAR2(1), -- Operaci�n 
    tip_accion_padre VARCHAR2(1), -- Operaci�n padre
    nom_script       VARCHAR2(100),
    des_estado_scrip VARCHAR2(20));

  TYPE t_t_his_proc IS TABLE OF t_r_his_proc INDEX BY BINARY_INTEGER;

  TYPE t_r_estado IS RECORD(
    cod_estado NUMBER(1),
    des_estado VARCHAR2(20));

  TYPE t_t_estado IS TABLE OF t_r_estado INDEX BY BINARY_INTEGER;

  TYPE t_r_tip_objeto IS RECORD(
    tip_objeto VARCHAR2(20));

  TYPE t_t_tip_objeto IS TABLE OF t_r_tip_objeto INDEX BY BINARY_INTEGER;
  /* Tipos de objetos:
  TABLA
  COLUMNA
  VISTA
  VM
  INDICE
  CHECK
  PK
  FK
  AK
  SECUENCIA
  PARTICION
  SUBPARTICION
  TYPE
  TYPE BODY
  COMENTARIO
  COMENTARIO COL.
  CONSTRAINT
  INDEFINIDO
  PERMISO
  SINONIMO
  VIEW LOG
  TEMPLATE
  */

  TYPE t_r_operacion IS RECORD(
    tip_accion VARCHAR2(1),
    des_accion VARCHAR2(20));

  TYPE t_t_operacion IS TABLE OF t_r_operacion INDEX BY BINARY_INTEGER;

  /* Operaciones:
  A - ALTA
  B - BAJA
  M - MODIFICACI�N
  R - RENOMBRADO 
  */

  TYPE t_r_informe_cambios IS RECORD(
    cod_peticion     VARCHAR2(25), -- Petici�n
    id_proceso       NUMBER, -- C�digo Procesado
    nom_objeto_padre VARCHAR2(30), -- Objeto padre
    tip_obj_padre    VARCHAR2(20), -- Tipo Objeto
    tip_accion_padre VARCHAR2(2), -- Acci�n
    nom_objeto       VARCHAR2(30), -- Objeto
    nom_objeto_dest  VARCHAR2(30), -- Objeto destino
    tip_objeto       VARCHAR2(20), -- Tipo Objeto
    tip_accion       VARCHAR2(2), -- Acci�n
    tip_dato         VARCHAR2(18), -- Tipo Dato
    num_longitud     NUMBER, -- Precisi�n
    num_decimal      NUMBER, -- Escala
    des_estado_proc  VARCHAR2(20), -- Estado Procesado
    fec_proceso      DATE, --Fecha inicio procesado.
    cod_sub_proy     VARCHAR2(30), -- Submodelo
    cod_usr_peticion VARCHAR2(8), -- Solicitado
    cod_usr          VARCHAR2(8), -- Usuario
    des_estado_scrip VARCHAR2(20), -- Estado script
    nom_script       VARCHAR2(100)); -- Nombre Script

  TYPE t_t_informe_cambios IS TABLE OF t_r_informe_cambios INDEX BY BINARY_INTEGER;

  TYPE t_r_log_ejecucion IS RECORD(
    nom_script      VARCHAR2(100),
    id_proceso      NUMBER,
    num_orden       NUMBER, -- No har�a falta mostrarlo en pantalla, pero es necesario para pas�rselo a p_elimina_log
    num_iteracion   NUMBER,
    num_ejecucion   NUMBER,
    num_parche      NUMBER, -- No har�a falta mostrarlo en pantalla, pero es necesario para pas�rselo a p_elimina_log
    num_sentencia   NUMBER,
    tip_objeto      VARCHAR2(20),
    tip_accion      VARCHAR2(2),
    nom_objeto      VARCHAR2(30),
    des_estado_ejec VARCHAR2(20),
    mca_eliminada   VARCHAR2(1), -- Valores S/N
    txt_obs_elimina VARCHAR2(500)); -- Comentario

  TYPE t_t_log_ejecucion IS TABLE OF t_r_log_ejecucion INDEX BY BINARY_INTEGER;

  /*----------------------------------------------------------------------------------------
  || Procedimiento de procesado de un script
  || p_script                      : Conjunto de l�neas que forman el script a procesar. 
  ||                                 Se enviar�n todas las l�neas que contenga el script, tanto si est�n vac�as o solo es un salto de l�nea. 
  || p_cod_proyecto                : C�digo de modelo
  || p_cod_sub_proy                : C�digo de submodelo
  || p_cod_peticion                : C�digo de petici�n
  || p_cod_demanda                 : C�digo de demanda
  || p_cod_usr                     : C�digo de usuario logado en la aplicaci�n
  || p_cod_usr_peticion            : C�digo de peticionario (Solicitada por)
  || p_mca_reprocesa               : Reprocesado: Si se trata de un reprocesado, se informar� S/N.
  || p_nom_BBDD                    : BBDD
  || p_nom_esquema                 : Esquema
  || p_mca_HIS                     : Genera hist�rico (valores S y N)
  || p_nom_BBDD_HIS                : BBDD Hist�rico
  || p_nom_esquema_his             : Esquema Hist�rico
  || p_nom_fich_entrada            : Nombre del script a procesar.
  || p_txt_ruta_entrada            : Ruta completa
  || p_lista_obj_his               : Lista de objetos de los que se quiere generar hist�rico.
  || p_txt_descripcion             : Descripci�n.
  || p_id_proceso                  : N�mero de procesado
  || p_fec_proceso                 : Fecha de procesado
  || p_cod_estado_proc             : Estado del procesado (c�digo)
  || p_des_estado_proc             : Estado del procesado (descripci�n)
  || p_lista_scripts               : Listado de scripts
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                             p_lista_errores    IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento de procesado de un script de objetos TYPE
  || Entrada:
  || p_script                      : Conjunto de l�neas que forman el script a procesar. 
  ||                                 Se enviar�n todas las l�neas que contenga el script, tanto si est�n vac�as o solo es un salto de l�nea.
  || p_cod_proyecto                : C�digo de modelo
  || p_cod_sub_proy                : C�digo de submodelo
  || p_cod_peticion                : C�digo de petici�n
  || p_cod_demanda                 : C�digo de demanda
  || p_cod_usr                     : C�digo de usuario: usuario logado en la aplicaci�n.
  || p_cod_usr_peticion            : C�digo del solicitante de la petici�n
  || p_nom_BBDD                    : BBDD
  || p_nom_esquema                 : Esquema
  || p_nom_fich_entrada            : Nombre del script a procesar.
  || p_txt_ruta_entrada            : Ruta completa de donde est� situado el script a procesar.
  || p_txt_descripcion             : Descripci�n
  || Salida:
  || p_id_proceso                  : N�mero de procesado: N�mero de que se ha otorgado desde la l�gica de negocio del procesado en curso. Se debe almacenar para realizar otras invocaciones.
  || p_fec_proceso                 : Fecha de procesado
  || p_cod_estado_proc             : Estado del procesado (c�digo)
  || p_des_estado_proc             : Estado del procesado (descripci�n)
  || p_nom_script_lanza            : Nombre Script Lanzador
  || p_txt_script_lanza            : Contenido Lanzador
  || p_nom_script_log              : Nombre log lanzador
  || p_lista_type                  : Listado de objetos
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                           p_lista_errores    IN OUT NOCOPY t_t_error);

  /* MODIFICADO 19/08/2022 - Se corrige nombre del par�metro p_cod_sub_proy (faltaba el prefijo p_ )*/
  /*----------------------------------------------------------------------------------------
  || Procedimiento de b�squeda de modelos
  || Entrada:
  || p_cod_proyecto       : C�digo de modelo
  || p_nom_modelo         : Texto para buscar por nombre de modelo
  || p_cod_sub_proy       : C�digo de submodelo
  || Salida:
  || p_lista_modelos      : Lista de modelos que cumplen las condiciones de b�squeda
  || p_resultado          : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores      : Lista de errores
  */ ---------------------------------------------------------------------------------------
  procedure p_con_modelos(p_cod_proyecto  IN VARCHAR2,
                          p_nom_modelo    IN VARCHAR2,
                          p_cod_sub_proy  IN VARCHAR2, -- se a�ade p_
                          p_lista_modelos OUT NOCOPY t_t_modelo,
                          p_resultado     IN OUT NOCOPY INTEGER,
                          p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento de consulta de los avisos de un modelo
  || Entrada:
  || p_cod_proyecto       : C�digo de modelo
  || Salida:
  || p_lista_avisos       : Lista de avisos para el modelo
  || p_resultado          : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores      : Lista de errores
  */ ---------------------------------------------------------------------------------------
  procedure p_con_avisos_modelo(p_cod_proyecto  IN VARCHAR2,
                                p_lista_avisos  OUT NOCOPY t_t_aviso,
                                p_resultado     IN OUT NOCOPY INTEGER,
                                p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devolver� los procesados que cumplan los filtros indicados en orden de fecha de inicio de procesado. Al menos es obligatorio informar uno de los filtros.
  || Entrada:
  || p_cod_peticion                : Petici�n.
  || p_cod_usr_peticion            : Usuario solicitante (Solicitado).
  || p_fec_inicio                  : Fecha inicio.
  || p_fec_fin                     : Fecha Fin
  || p_cod_usr                     : Usuario de proceso
  || p_cod_proyecto                : Modelo
  || p_cod_sub_proy                : Submodelo
  || p_des_estado_proc             : Estado procesado
  || p_ultimas                     : Par�metro que indica si se devuelven todas las peticiones o solo las �ltimas (10 �ltimas).1 devuelve las �ltimas, 0 o vac�o, devuelve todas las ocurrencias.
  || Salida:
  || p_lista_procesos              : Listado de procesados
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                             p_lista_errores    IN OUT NOCOPY t_t_error);

  /* MODIFICADO 19/08/2022 - Se a�ade par�metro de entrada p_cod_sub_proy*/
  /*----------------------------------------------------------------------------------------
  || Procedimiento de consulta de las bases de datos de un modelo /submodelo 
  || Entrada:
  || p_cod_proyecto       : C�digo de modelo
  || p_cod_sub_proy       : C�digo de submodelo
  || Salida:
  || p_lista_BBDD         : Lista de bases de datos para el modelo
  || p_resultado          : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores      : Lista de errores
  */ ---------------------------------------------------------------------------------------
  procedure p_con_bbdd_modelo(p_cod_proyecto  IN VARCHAR2,
                              p_cod_sub_proy  IN VARCHAR2, -- Nuevo par�metro de entrada
                              p_lista_BBDD    OUT NOCOPY t_t_BBDD,
                              p_resultado     IN OUT NOCOPY INTEGER,
                              p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que extrae las tablas, vistas y secuencias del script seleccionado para 
  || identificar si est�n ya configuradas para hist�rico o no. Devolver� aquellas tablas ya 
  || configuradas en hist�rico y las que se creen en la petici�n.
  || Entrada
  || p_script                      : Conjunto de l�neas que forman el script a procesar. 
  ||                                 Se enviar�n todas las l�neas que contenga el script, tanto si est�n vac�as o solo es un salto de l�nea. 
  || p_cod_proyecto                : C�digo de modelo
  || Salida
  || p_lista_obj_his               : Listado de objetos con hist�rico
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_sel_historico(p_script        IN t_t_linea,
                            p_cod_proyecto  IN VARCHAR2,
                            p_lista_obj_his OUT NOCOPY t_t_obj_his,
                            p_resultado     IN OUT NOCOPY INTEGER,
                            p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que a�ade tablas, vistas y secuencias al hist�rico.
  || Entrada
  || p_lista_obj_his               : Listado de objetos a a�adir al hist�rico
  || p_cod_proyecto                : C�digo de modelo
  || p_cod_peticion                : Petici�n.
  || p_cod_usr                     : C�digo de usuario logado en la aplicaci�n.
  || Salida
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_alta_historico(p_lista_objetos IN t_t_objetos,
                             p_cod_proyecto  IN VARCHAR2,
                             p_cod_peticion  IN VARCHAR2,
                             p_cod_usr       IN VARCHAR2,
                             p_resultado     IN OUT NOCOPY INTEGER,
                             p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve la contrase�a de una BBDD. Parte de la clave se almacenar� en la tabla de configuraci�n
  || Entrada:
  || p_nom_BBDD                    : BBDD
  || p_nom_esquema                 : Esquema
  || p_txt_clave_encript           : Clave encriptado
  || Salida:
  || p_txt_pwd                     : Contrase�a
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_con_pass_bbdd(p_nom_BBDD          IN VARCHAR2,
                            p_nom_esquema       IN VARCHAR2,
                            p_txt_clave_encript IN VARCHAR2,
                            p_txt_pwd           OUT NOCOPY VARCHAR2,
                            --p_txt_observacion   OUT NOCOPY VARCHAR2, -- Eliminado 07/09/2022 - No se necesita
                            --p_mca_habilitado    OUT NOCOPY VARCHAR2, -- Eliminado 07/09/2022 - No se necesita
                            p_resultado     IN OUT NOCOPY INTEGER,
                            p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que trata el fichero de log generado por Oracle tras la ejecuci�n de un script
  || Entrada:
  || p_id_proceso                  : N�mero de procesado
  || p_num_orden                   : N�mero de orden
  || p_cod_usr                     : Usuario de proceso
  || p_log_script                  : Contenido del log. Se enviar�n todas las l�neas que contenga el log, tanto si est�n vac�as o s�lo es un salto de l�nea
  || Salida:
  || p_cod_estado_proc             : Estado procesado (c�digo)
  || p_des_estado_proc             : Estado procesado (descripci�n)
  || p_nom_script                  : Nombre del fichero.
  || p_cod_estado_scrip            : Estado del script (c�digo)
  || p_des_estado_scrip            : Estado del script (descripci�n)
  || p_txt_cuadre_oper             : Cuadre Operaciones: texto que indica si hay descuadre en las operaciones (OK / Error)
  || p_txt_cuadre_obj              : Cuadre Objetos: texto que indica si hay descuadre en los Objetos (OK / Error)
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                                 p_lista_errores    IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que trata el fichero de log generado por Oracle tras la ejecuci�n de un script de parche
  || Entrada:
  || p_id_proceso                  : N�mero de procesado
  || p_num_orden                   : N�mero de orden
  || p_cod_usr                     : Usuario de proceso
  || p_log_script                  : Contenido del log. Se enviar�n todas las l�neas que contenga el log, tanto si est�n vac�as o s�lo es un salto de l�nea
  || p_ind_repara                  : Tipo de operaci�n que motiva el parche: Reparaci�n (R) o Descarte (D)
  || Salida:
  || p_cod_estado_proc             : Estado procesado (c�digo)
  || p_des_estado_proc             : Estado procesado (descripci�n)
  || p_nom_script                  : Nombre del fichero.
  || p_cod_estado_scrip            : Estado del script (c�digo)
  || p_des_estado_scrip            : Estado del script (descripci�n)
  || p_txt_cuadre_oper             : Cuadre Operaciones: texto que indica si hay descuadre en las operaciones (OK / Error)
  || p_txt_cuadre_obj              : Cuadre Objetos: texto que indica si hay descuadre en los Objetos (OK / Error)
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                                        p_lista_errores    IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que trata el fichero de log generado por Oracle tras la ejecuci�n de un script de objetos TYPE
  || Entrada:
  || p_id_proceso                  : N�mero de procesado
  || p_cod_usr                     : Usuario de proceso
  || p_log_script                  : Contenido del log. Se enviar�n todas las l�neas que contenga el log, tanto si est�n vac�as o s�lo es un salto de l�nea
  || Salida:
  || p_cod_estado_proc             : Estado procesado (c�digo)
  || p_des_estado_proc             : Estado procesado (descripci�n)
  || p_lista_type                  : Lista de objetos TYPE
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_registra_ejecucion_type(p_id_proceso      IN NUMBER,
                                      p_cod_usr         IN VARCHAR2,
                                      p_log_script      IN t_t_linea,
                                      p_cod_estado_proc OUT NOCOPY NUMBER,
                                      p_des_estado_proc OUT NOCOPY VARCHAR2,
                                      p_lista_type      OUT NOCOPY t_t_type,
                                      p_resultado       IN OUT NOCOPY INTEGER,
                                      p_lista_errores   IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento de consulta de un procesado
  || Entrada
  || p_id_proceso                  : C�digo de procesado
  || Salida
  || p_nom_modelo                  : Modelo
  || p_cod_usr_peticion            : Solicitada
  || p_nom_bbdd_his                : BBDD hist�rico
  || p_des_sub_proy                : Submodelo
  || p_nom_esquema                 : Esquema
  || p_nom_esquema_his             : Esquema hist�rico
  || p_cod_peticion                : Petici�n
  || p_nom_bbdd                    : BBDD
  || p_cod_estado_proc             : Estado Procesado (c�digo)
  || p_des_estado_proc             : Estado Procesado (descripci�n)
  || p_cod_usr                     : Usuario
  || p_fec_proceso                 : Fecha de procesado
  || p_txt_comentario              : Comentarios procesado
  || p_mca_inicial                 : Es script inicial: Indica que el procesado est� asociado a la ejecuci�n de un script inicial en un entorno de pruebas
  || p_txt_ruta_entrada            : Ruta: Ruta completa de generaci�n
  || p_lista_ficheros              : Listado de ficheros ejecutados
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                            p_lista_errores     IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve el cuadre de operaciones del script
  || Entrada
  || p_id_proceso                  : C�digo de procesado
  || p_num_orden                   : N�mero de orden
  || Salida
  || p_cuadre_oper                 : Listado de cuadre de operaciones
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_con_cuadre_oper_script(p_id_proceso    IN NUMBER,
                                     p_num_orden     IN NUMBER,
                                     p_cuadre_oper   OUT NOCOPY t_t_cuadre_oper,
                                     p_resultado     IN OUT NOCOPY INTEGER,
                                     p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve el cuadre de operaciones del script
  || Entrada
  || p_id_proceso                  : C�digo de procesado
  || p_num_orden                   : N�mero de orden
  || Salida
  || p_cuadre_obj                  : Listado de cuadre de objetos
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_con_cuadre_obj_script(p_id_proceso    IN NUMBER,
                                    p_num_orden     IN NUMBER,
                                    p_cuadre_obj    OUT NOCOPY t_t_cuadre_obj,
                                    p_resultado     IN OUT NOCOPY INTEGER,
                                    p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Devuelve la ruta donde se debe entregar el fichero ZIP con los nombres de los scripts a entregar en la petici�n
  || Entrada:
  || p_cod_proyecto                : C�digo de modelo
  || p_id_proceso                  : N�mero de procesado
  || Salida:
  || p_txt_ruta_entrega            : Ruta
  || p_nom_fichero_vig             : Nombre fichero zip vigente
  || p_nom_fichero_his             : Nombre fichero zip hist�rico
  || p_nom_fichero_typ             : Nombre fichero zip Types
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_con_ruta_entrega(p_cod_proyecto     IN VARCHAR2,
                               p_id_proceso       IN NUMBER,
                               p_txt_ruta_entrega OUT NOCOPY VARCHAR2,
                               p_nom_fichero_vig  OUT NOCOPY VARCHAR2,
                               p_nom_fichero_his  OUT NOCOPY VARCHAR2,
                               p_nom_fichero_typ  OUT NOCOPY VARCHAR2,
                               p_resultado        IN OUT NOCOPY INTEGER,
                               p_lista_errores    IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento de entrega de una petici�n
  || Entrada:
  || p_id_proceso                  : C�digo de procesado.
  || p_cod_usr                     : Usuario logado en la aplicaci�n 
  || p_txt_comentario              : Descripci�n de la entrega
  || Salida:
  || p_des_estado_proc             : Estado Procesado
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_entregar_peticion(p_id_proceso      IN NUMBER,
                                p_cod_usr         IN VARCHAR2,
                                p_txt_comentario  IN VARCHAR2,
                                p_des_estado_proc OUT NOCOPY VARCHAR2,
                                p_resultado       IN OUT NOCOPY INTEGER,
                                p_lista_errores   IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve los errores que se han producido en BBDD al ejecutar un script
  || Entrada:
  || p_id_proceso                  : C�digo de procesado
  || p_num_orden                   : N�mero de orden
  || Salida:
  || p_lista_errores_script        : Listado de errores del script.
  || p_lista_parches               : Listado de Parches asociados
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------                             
  procedure p_con_errores_script(p_id_proceso           IN NUMBER,
                                 p_num_orden            IN NUMBER,
                                 p_lista_errores_script OUT NOCOPY t_t_error_script,
                                 p_lista_parches        OUT NOCOPY t_t_script_parche,
                                 p_resultado            IN OUT NOCOPY INTEGER,
                                 p_lista_errores        IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve los errores que se han producido en BBDD al ejecutar un script de objetos TYPE
  || Entrada:
  || p_id_proceso                  : C�digo de procesado
  || p_num_orden                   : N�mero de orden
  || Salida:
  || p_lista_errores_script        : Listado de errores del script.
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------                             
  procedure p_con_errores_type(p_id_proceso         IN NUMBER,
                               p_num_orden          IN NUMBER,
                               p_lista_errores_type OUT NOCOPY t_t_error_script,
                               p_resultado          IN OUT NOCOPY INTEGER,
                               p_lista_errores      IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que marca un procesado como rechazado
  || Entrada:
  || p_id_proceso                  : C�digo de procesado
  || p_txt_comentario              : Comentarios del rechazo
  || p_cod_usr                     : Usuario logado en la aplicaci�n 
  || Salida:
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------                                  
  procedure p_rechazar_procesado(p_id_proceso     IN NUMBER,
                                 p_txt_comentario IN VARCHAR2,
                                 p_cod_usr        IN VARCHAR2,
                                 p_resultado      IN OUT NOCOPY INTEGER,
                                 p_lista_errores  IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que repara un script en estado Error o Descuadrado, cuyo procesado no est� Rechazado. La reparaci�n puede conllevar el reprocesado del script o no
  || Entrada:
  || p_id_proceso                  : C�digo proceso.
  || p_num_orden                   : N�mero de orden del script reparado
  || p_cod_usr                     : Usuario logado en la aplicaci�n 
  || p_mca_reprocesa               : Se debe reprocesar.
  || p_mca_mismo_script            : Se ejecuta el mismo script.
  || p_nom_script_new              : Nombre nuevo script a procesar.
  || p_txt_ruta_new                : Ruta nuevo script a procesar.
  || p_script_new                  : Conjunto de l�neas que forman el script a reprocesar.
  || p_txt_comentario              : Comentario.
  || p_nom_script_parche           : Nombre script reparaci�n.
  || p_txt_ruta_parche             : Ruta script reparaci�n.
  || p_script_parche               : Contenido script reparaci�n.
  || Salida:
  || p_nom_script_repara           : Nombre script reparaci�n.
  || p_script_repara               : Contenido script reparaci�n.
  || p_nom_script_lanza            : Nombre Script Lanzador de reparaci�n.
  || p_script_lanza                : Contenido Lanzador de reparaci�n.
  || p_nom_log_repara              : Nombre log lanzador de reparaci�n.
  || p_lista_script_old            : Listado Scripts Anteriores para renombrarlos
  || p_lista_script                : Listado de scripts. Se informar� en el caso de que se haya solicitado reprocesar el
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                            p_lista_errores     IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que descarta scripts de vigente ejecutados correctamente debido a cambios en el contenido de la petici�n
  || Entrada:
  || p_script                      : Conjunto de l�neas que forman el script a reprocesar.
  || p_id_proceso                  : C�digo proceso
  || p_cod_usr                     : Usuario logado en la aplicaci�n 
  || p_nom_script                  : Nombre Script
  || p_tip_cambio                  : Tipo cambio: Ampliaci�n (A) o Reducci�n (R)
  || p_nom_script_new              : Nombre nuevo script a procesar
  || p_txt_ruta_new                : Ruta nuevo script a procesar
  || p_txt_comentario              : Comentario descarte. Obligatorio
  || p_nom_script_parche           : Nombre script parche
  || p_txt_ruta_parche             : Ruta script Parche
  || p_script_parche               : Contenido script Parche. Puede ir vac�o. En tal caso se devolver� un script de parche sin sentencias para que al ejecutarlo no haya errores.
  || Salida:
  || p_lista_parches               : Listado de Parches
  || p_lista_script_old            : Listado Scripts Anteriores
  || p_lista_script_new            : Listado de scripts
  || p_cod_estado_proc             : Estado del procesado (c�digo)
  || p_des_estado_proc             : Estado del procesado (descripci�n)
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
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
                               p_lista_errores     IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que marca un script ejecutado con error como excepci�n
  || Entrada:
  || p_id_proceso                  : C�digo de procesado
  || p_num_orden                   : N�mero de orden del script 
  || p_txt_comentario              : Comentarios de la excepci�n
  || p_cod_estado_proc             : Estado del procesado (c�digo)
  || p_des_estado_proc             : Estado del procesado (descripci�n)
  || p_cod_estado_script           : Estado del script (c�digo)
  || p_des_estado_script           : Estado del script (descripci�n)
  || Salida:
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------                                  
  procedure p_excepcion_script(p_id_proceso        IN NUMBER,
                               p_num_orden         IN NUMBER, -- A�adido 07/09/2022. Aparec�a en la cabecera pero faltaba aqu�
                               p_txt_comentario    IN VARCHAR2,
                               p_cod_usr           IN VARCHAR2,
                               p_cod_estado_proc   OUT NOCOPY NUMBER,
                               p_des_estado_proc   OUT NOCOPY VARCHAR2,
                               p_cod_estado_script OUT NOCOPY NUMBER,
                               p_des_estado_script OUT NOCOPY VARCHAR2,
                               p_resultado         IN OUT NOCOPY INTEGER,
                               p_lista_errores     IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve el conjunto de objetos afectados por un script, ordenados por sentencia ascendente
  || Entrada:
  || p_id_proceso                  : C�digo de procesado
  || p_num_orden                   : N�mero de orden
  || Salida:
  || p_lista_det_objetos           : Lista con el detalle de objetos
  || p_resultado                   : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores               : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_detalle_objetos_scripts(p_id_proceso        IN NUMBER,
                                      p_num_orden         IN NUMBER,
                                      p_lista_det_objetos OUT NOCOPY t_t_det_objeto,
                                      p_resultado         IN OUT NOCOPY INTEGER,
                                      p_lista_errores     IN OUT NOCOPY t_t_error);

  -- 05/10/2022 Se a�aden el resto de procedimientos que faltaban
  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve el hist�rico de scripts en los que se ha modificado un objeto,
  || de acuerdo con los critrios de selecci�n
  || Entrada:
  || p_cod_proyecto       : C�digo de modelo
  || p_nom_objeto_padre   : Nombre del objeto padre
  || p_tip_objeto_padre   : Tipo de objeto padre
  || p_tip_accion_padre   : Tipo de acci�n padre
  || p_nom_objeto         : Nombre del objeto hijo (columnas)
  || p_tip_objeto         : Tipo de objeto hijo
  || p_tip_accion         : Tipo de acci�n hijo
  || p_fec_desde          : Fecha de inicio de la b�squeda
  || p_fec_hasta          : Fecha de fin de la b�squeda
  || p_cod_estado_proc    : C�digo de estado del procesado
  || p_cod_estado_scrip   : C�digo de estado del script
  || Salida:
  || p_lista_his_proc     : Lista con el hist�rico del objeto
  || p_resultado          : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores      : Lista de errores
  */ ----------------------------------------------------------------------------------------                                    
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
                                   p_lista_errores    IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve la lista de tipos de objetos
  || Salida:
  || p_lista_his_proc     : Lista de tipos de objeto
  || p_resultado          : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores      : Lista de errores
  */ ----------------------------------------------------------------------------------------                                    
  procedure p_con_tipos_objeto(p_lista_tip_objeto OUT NOCOPY t_t_tip_objeto,
                               p_resultado        IN OUT NOCOPY INTEGER,
                               p_lista_errores    IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve la lista de estados de un procesado
  || Salida:
  || p_lista_estados     : Lista de estados del procesado (c�digo/descripci�n)
  || p_resultado         : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores     : Lista de errores
  */ ----------------------------------------------------------------------------------------                                                                          
  procedure p_con_estados_proc(p_lista_estados OUT NOCOPY t_t_estado,
                               p_resultado     IN OUT NOCOPY INTEGER,
                               p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve la lista de estados de un script
  || Salida:
  || p_lista_estados     : Lista de estados del script (c�digo/descripci�n)
  || p_resultado         : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores     : Lista de errores
  */ ----------------------------------------------------------------------------------------                                                                                                        
  procedure p_con_estados_scrip(p_lista_estados OUT NOCOPY t_t_estado,
                                p_resultado     IN OUT NOCOPY INTEGER,
                                p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve la lista de tipos de operaci�n de un script
  || Salida:
  || p_lista_operaci�n   : Lista de operaciones (c�digo/descripci�n)
  || p_resultado         : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores     : Lista de errores
  */ ----------------------------------------------------------------------------------------                                                                                                                                              
  procedure p_con_operaciones(p_lista_operacion OUT NOCOPY t_t_operacion,
                              p_resultado       IN OUT NOCOPY INTEGER,
                              p_lista_errores   IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve el informe de cambios
  || Entrada:
  || p_cod_proyecto      : C�digo de modelo
  || p_fec_desde         : Fecha de inicio de la b�squeda
  || p_fec_hasta         : Fecha de fin de la b�squeda    
  || Salida:
  || p_lista_operaci�n   : Lista de operaciones (c�digo/descripci�n)
  || p_resultado         : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores     : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_informe_cambios(p_cod_proyecto  IN VARCHAR2,
                              p_fec_desde     IN DATE,
                              p_fec_hasta     IN DATE,
                              p_lista_cambios OUT NOCOPY t_t_informe_cambios,
                              p_resultado     IN OUT NOCOPY INTEGER,
                              p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que devuelve las operaciones que figuran en el log de la �ltima ejecuci�n de un script
  || Entrada:
  || p_id_proceso        : C�digo de procesado
  || p_num_orden         : N�mero de orden del script seleccionado en pantalla Ejecutar Scripts
  || Salida:
  || p_lista_log         : Lista de operaciones registradas en los log
  || p_resultado         : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores     : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_log_ejecucion(p_id_proceso    IN NUMBER,
                            p_num_orden     IN NUMBER, -- viene de una pantalla anterior: Ejecutar Scripts. Es el num_orden del script seleccionado
                            p_lista_log     OUT NOCOPY t_t_log_ejecucion,
                            p_resultado     IN OUT NOCOPY INTEGER,
                            p_lista_errores IN OUT NOCOPY t_t_error);

  /*----------------------------------------------------------------------------------------
  || Procedimiento que marca como eliminado un registro del LOG de un script. 
  || Entrada:
  || p_id_proceso        : C�digo de procesado
  || p_num_orden         : N�mero de orden
  || p_num_iteracion     : N�mero de iteraci�n
  || p_num_ejecucion     : N�mero de ejecuci�n
  || p_num_parche        : N�mero de parche
  || p_num_sentencia     : N�mero de sentencia
  || p_txt_comentario    : Comentario
  || Salida:
  || p_resultado         : Resultado de la operaci�n (1- Correcto, 0-Error, 2-Aviso)
  || p_lista_errores     : Lista de errores
  */ ----------------------------------------------------------------------------------------
  procedure p_elimina_log(p_id_proceso     IN NUMBER,
                          p_num_orden      IN NUMBER,
                          p_num_iteracion  IN NUMBER,
                          p_num_ejecucion  IN NUMBER,
                          p_num_parche     IN NUMBER,
                          p_num_sentencia  IN NUMBER,
                          p_txt_comentario IN VARCHAR2,
                          p_resultado      IN OUT NOCOPY INTEGER,
                          p_lista_errores  IN OUT NOCOPY t_t_error);
END sm2_k_ld_MDSQL;
