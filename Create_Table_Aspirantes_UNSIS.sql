-- Creación de tablas
CREATE TABLE public."Rol" (
    id integer NOT NULL,
    rol_nombre character varying(255),
    CONSTRAINT "Rol_pkey" PRIMARY KEY (id)
);

CREATE TABLE public."Usuarios" (
    "Clave" integer NOT NULL,
    "Nombre" character varying(255),
    contra character varying(255),
    CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("Clave")
);

CREATE TABLE public."Sede" (
    idSede integer NOT NULL,
    nombre character varying(255),
    CONSTRAINT "Sede_pkey" PRIMARY KEY (idSede)
);

CREATE TABLE public."Aspirante" (
    id integer NOT NULL,
    carrera character varying(255),
    ficha character varying(255),
    hora character varying(255),
    nombre character varying(255),
    promedio character varying(255),
    resultado character varying(255),
    visto boolean,
    id_usuario integer,
    curp character varying(255),
    asistio boolean DEFAULT false,
    aula character varying(255),
    fecha_aplicacion date,
    observaciones character varying(255),
    idSede integer,
    CONSTRAINT "Aspirante_pkey" PRIMARY KEY (id),
    CONSTRAINT fk_aspirante_usuario FOREIGN KEY (id_usuario)
        REFERENCES public."Usuarios" ("Clave"),
    CONSTRAINT fk_aspirante_sede FOREIGN KEY (idSede)
        REFERENCES public."Sede" (idSede)
);

CREATE TABLE public."Usuario_rol" (
    usuarios_clave integer,
    rol_id integer,
    CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY (usuarios_clave)
        REFERENCES public."Usuarios" ("Clave"),
    CONSTRAINT fk_usuario_rol_rol FOREIGN KEY (rol_id)
        REFERENCES public."Rol" (id)
);

-- Índices para mejorar rendimiento
CREATE INDEX idx_aspirante_id_usuario ON public."Aspirante"(id_usuario);
CREATE INDEX idx_aspirante_idSede ON public."Aspirante"(idSede);
CREATE INDEX idx_usuario_rol_clave ON public."Usuario_rol"(usuarios_clave);
CREATE INDEX idx_usuario_rol_id ON public."Usuario_rol"(rol_id);

-- Comentarios descriptivos
COMMENT ON TABLE public."Rol" IS 'Tabla de roles de usuarios del sistema';
COMMENT ON TABLE public."Usuarios" IS 'Tabla de usuarios del sistema';
COMMENT ON TABLE public."Sede" IS 'Tabla de sedes donde aplican los aspirantes';
COMMENT ON TABLE public."Aspirante" IS 'Tabla de aspirantes y sus resultados de admisión';
COMMENT ON TABLE public."Usuario_rol" IS 'Tabla de relación entre usuarios y roles';