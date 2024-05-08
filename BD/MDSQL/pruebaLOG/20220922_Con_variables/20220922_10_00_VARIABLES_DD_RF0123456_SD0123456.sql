CREATE TABLE &&USROWN..CLIENTES2(
COD_CLIENTE VARCHAR2(10) NOT NULL,
TXT_NOMBRE VARCHAR2(50) NOT NULL,
TXT_APELLIDO1 VARCHAR2(50) NOT NULL,
TXT_APELLIDO2 VARCHAR2(50),
COD_DOCUM VARCHAR2(10) NOT NULL
);
COMMENT ON TABLE &&USROWN..CLIENTES2 IS 'TABLA DE CLIENTES2';
COMMENT ON COLUMN &&USROWN..CLIENTES2.COD_CLIENTE IS 'CODIGO DE CLIENTE';
COMMENT ON COLUMN &&USROWN..CLIENTES2.TXT_NOMBRE IS 'NOMBRE DEL CLIENTE';
COMMENT ON COLUMN &&USROWN..CLIENTES2.TXT_APELLIDO1 IS 'APELLIDO 1';
COMMENT ON COLUMN &&USROWN..CLIENTES2.TXT_APELLIDO2 IS 'APELLIDO 2';
COMMENT ON COLUMN &&USROWN..CLIENTES2.COD_DOCUM IS 'DOCUMENTO DE IDENTIDAD';

CREATE UNIQUE INDEX &&USROWN..PK_CLIENTES2 ON &&USROWN..CLIENTES2
       (COD_CLIENTE ASC);

ALTER TABLE &&USROWN..CLIENTES2
      ADD CONSTRAINT PK_CLIENTES2
      PRIMARY KEY(COD_CLIENTE)
      USING INDEX &&USROWN..PK_CLIENTES2;

CREATE UNIQUE INDEX &&USROWN..AK_CLIENTES2 ON &&USROWN..CLIENTES2
       (COD_DOCUM ASC);
