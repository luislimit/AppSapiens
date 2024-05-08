---------------------------------------------------------------------------------------
-- Ejemplo de cómo sería la estructura de modelos resultante de invocar a p_con_modelos
---------------------------------------------------------------------------------------
declare

  -- Estructuras utilizadas (son las mismas del paquete) 
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
    cod_capa_usrown  VARCHAR2(10), -- Valores S ó N
    mca_variables    VARCHAR2(1), -- Valores S ó N 
    mca_grant_all    VARCHAR2(1), -- Valores S ó N
    mca_grant_public VARCHAR2(1), -- Valores S ó N
    mca_inh          VARCHAR2(1), -- Valores S ó N
    obs_modelo       VARCHAR2(200),
    mca_pdc          VARCHAR2(1), -- Valores S ó N
    mca_his          VARCHAR2(1), -- Valores S ó N  
    lista_sub_proy   t_t_subproyecto);

  -- Lista de Modelos
  TYPE t_t_modelo IS TABLE OF t_r_modelo INDEX BY BINARY_INTEGER;
  
  -- Variable para el ejemplo
  --p_lista_modelos SM2_K_LD_MDSQL.T_T_MODELO;
  p_lista_modelos t_t_modelo;
   

begin
  -- En este ejemplo la estructura contiene 3 modelos, cada uno con varios submodelos

  -- MODELO 1 --
  -- Campos simples
  p_lista_modelos(1).cod_proyecto := 'MOD1';
  p_lista_modelos(1).nom_modelo := 'MODELO 1';
  p_lista_modelos(1).nom_esquema := 'ESQUEMA1';
  p_lista_modelos(1).nom_bbdd := 'BBDD1';
  p_lista_modelos(1).nom_carpeta_adj := 'CARPETA 1';
  p_lista_modelos(1).cod_capa_usrown := 'S';
  p_lista_modelos(1).mca_variables := 'S';
  p_lista_modelos(1).mca_grant_all := 'N';
  p_lista_modelos(1).mca_grant_public := 'N';
  p_lista_modelos(1).mca_inh := 'N';
  p_lista_modelos(1).obs_modelo := 'OBSERVACIONES 1';
  p_lista_modelos(1).mca_pdc := 'S';
  p_lista_modelos(1).mca_his := 'N';

  -- Estructura anidada (2 submodelos)
  p_lista_modelos(1).lista_sub_proy(1).cod_sub_proy := 'SUB1';
  p_lista_modelos(1).lista_sub_proy(1).des_sub_proy := 'SUBMODELO 1';

  p_lista_modelos(1).lista_sub_proy(2).cod_sub_proy := 'SUB2';
  p_lista_modelos(1).lista_sub_proy(2).des_sub_proy := 'SUBMODELO 2';

  -- MODELO 2 --
  -- Campos simples
  p_lista_modelos(2).cod_proyecto := 'MOD2';
  p_lista_modelos(2).nom_modelo := 'MODELO 2';
  p_lista_modelos(2).nom_esquema := 'ESQUEMA2';
  p_lista_modelos(2).nom_bbdd := 'BBDD2';
  p_lista_modelos(2).nom_carpeta_adj := 'CARPETA 2';
  p_lista_modelos(2).cod_capa_usrown := 'S';
  p_lista_modelos(2).mca_variables := 'S';
  p_lista_modelos(2).mca_grant_all := 'N';
  p_lista_modelos(2).mca_grant_public := 'N';
  p_lista_modelos(2).mca_inh := 'N';
  p_lista_modelos(2).obs_modelo := 'OBSERVACIONES 2';
  p_lista_modelos(2).mca_pdc := 'S';
  p_lista_modelos(2).mca_his := 'N';

  -- Estructura anidada (3 submodelos)
  p_lista_modelos(2).lista_sub_proy(1).cod_sub_proy := 'SUB3';
  p_lista_modelos(2).lista_sub_proy(1).des_sub_proy := 'SUBMODELO 3';

  p_lista_modelos(2).lista_sub_proy(2).cod_sub_proy := 'SUB4';
  p_lista_modelos(2).lista_sub_proy(2).des_sub_proy := 'SUBMODELO 4';

  p_lista_modelos(2).lista_sub_proy(3).cod_sub_proy := 'SUB5';
  p_lista_modelos(2).lista_sub_proy(3).des_sub_proy := 'SUBMODELO 5';

  -- MODELO 3
  -- Campos simples
  p_lista_modelos(3).cod_proyecto := 'MOD3';
  p_lista_modelos(3).nom_modelo := 'MODELO 3';
  p_lista_modelos(3).nom_esquema := 'ESQUEMA3';
  p_lista_modelos(3).nom_bbdd := 'BBDD3';
  p_lista_modelos(3).nom_carpeta_adj := 'CARPETA 3';
  p_lista_modelos(3).cod_capa_usrown := 'S';
  p_lista_modelos(3).mca_variables := 'S';
  p_lista_modelos(3).mca_grant_all := 'N';
  p_lista_modelos(3).mca_grant_public := 'N';
  p_lista_modelos(3).mca_inh := 'N';
  p_lista_modelos(3).obs_modelo := 'OBSERVACIONES 3';
  p_lista_modelos(3).mca_pdc := 'S';
  p_lista_modelos(3).mca_his := 'N';

  -- Estructura anidada (1 submodelo)
  p_lista_modelos(3).lista_sub_proy(1).cod_sub_proy := 'SUB6';
  p_lista_modelos(3).lista_sub_proy(1).des_sub_proy := 'SUBMODELO 6';

  ----------------------------------------------------------
  -- Esto es un ejemplo de cómo leer en PLSQL la estructura:
  ----------------------------------------------------------
  if p_lista_modelos.count > 0 then
    for i in p_lista_modelos.first .. p_lista_modelos.last loop
      dbms_output.put_line('Lista de modelos');
      dbms_output.put_line('i = ' || i);
      dbms_output.put_line(' cod_proyecto = ' || p_lista_modelos(i).cod_proyecto);
      dbms_output.put_line(' nom_modelo = ' || p_lista_modelos(i).nom_modelo);
      dbms_output.put_line(' nom_esquema = ' || p_lista_modelos(i).nom_esquema);
      dbms_output.put_line(' nom_bbdd = ' || p_lista_modelos(i).nom_bbdd);
      dbms_output.put_line(' nom_carpeta_adj = ' || p_lista_modelos(i).nom_carpeta_adj);
      dbms_output.put_line(' cod_capa_usrown = ' || p_lista_modelos(i).cod_capa_usrown);
      dbms_output.put_line(' mca_variables = ' || p_lista_modelos(i).mca_variables);
      dbms_output.put_line(' mca_grant_all = ' || p_lista_modelos(i).mca_grant_all);
      dbms_output.put_line(' mca_grant_public = ' || p_lista_modelos(i).mca_grant_public);
      dbms_output.put_line(' mca_inh = ' || p_lista_modelos(i).mca_inh);
      dbms_output.put_line(' obs_modelo = ' || p_lista_modelos(i).obs_modelo);
      dbms_output.put_line(' mca_pdc = ' || p_lista_modelos(i).mca_pdc);
      dbms_output.put_line(' mca_his = ' || p_lista_modelos(i).mca_his);
    
      if p_lista_modelos(i).lista_sub_proy.count > 0 then
        dbms_output.put_line('Lista de submodelos');
        for j in p_lista_modelos(i).lista_sub_proy.first .. p_lista_modelos(i).lista_sub_proy.last loop
          dbms_output.put_line('j = ' || j);
          dbms_output.put_line(' cod_sub_proy = ' || p_lista_modelos(i).lista_sub_proy(j).cod_sub_proy);
          dbms_output.put_line(' des_sub_proy = ' || p_lista_modelos(i).lista_sub_proy(j).des_sub_proy);
        
        end loop;
      end if;
    
    end loop;
  end if;
end;
