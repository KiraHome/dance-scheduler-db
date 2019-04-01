--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dance-scheduler; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "dance-scheduler" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE "dance-scheduler" OWNER TO postgres;

\connect -reuse-previous=on "dbname='dance-scheduler'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounting (
    pay_timestamp timestamp without time zone NOT NULL,
    credit character varying(511),
    type character varying(64),
    id bigint NOT NULL
);


ALTER TABLE public.accounting OWNER TO postgres;

--
-- Name: accounting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounting_id_seq OWNER TO postgres;

--
-- Name: accounting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounting_id_seq OWNED BY public.accounting.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    name character varying(512) NOT NULL,
    comment character varying(5000) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    on_page character varying(127) NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credential (
    id smallint NOT NULL,
    username character varying(511) NOT NULL,
    password character varying(255) NOT NULL,
    privilege character varying(63) NOT NULL,
    fb_reg boolean NOT NULL,
    fb_id character varying(255),
    email character varying(511),
    uuid character varying(64),
    token character varying(255)
);


ALTER TABLE public.credential OWNER TO postgres;

--
-- Name: credential_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credential_id_seq OWNER TO postgres;

--
-- Name: credential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credential_id_seq OWNED BY public.credential.id;


--
-- Name: event_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_flow (
    source character varying(255) NOT NULL,
    priority smallint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    username character varying(511) NOT NULL,
    content character varying(5000) NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.event_flow OWNER TO postgres;

--
-- Name: event_flow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_flow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_flow_id_seq OWNER TO postgres;

--
-- Name: event_flow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_flow_id_seq OWNED BY public.event_flow.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    serial_id bigint NOT NULL,
    username character varying(511) NOT NULL,
    lastpaid character varying(255) NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_serial_id_seq OWNER TO postgres;

--
-- Name: payment_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_serial_id_seq OWNED BY public.payment.serial_id;


--
-- Name: personal_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_class (
    start character varying(300) NOT NULL,
    end_ character varying(300) NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(127) NOT NULL,
    id character varying(255) NOT NULL,
    cssclass character varying(255),
    serial_id bigint NOT NULL,
    recurring boolean NOT NULL,
    last_paid_class character varying(255)
);


ALTER TABLE public.personal_class OWNER TO postgres;

--
-- Name: personal_class_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_class_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_class_serial_id_seq OWNER TO postgres;

--
-- Name: personal_class_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_class_serial_id_seq OWNED BY public.personal_class.serial_id;


--
-- Name: timetable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timetable (
    serial_id bigint NOT NULL,
    start character varying(300) NOT NULL,
    end_ character varying(300) NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(64) NOT NULL,
    id character varying(255) NOT NULL,
    cssclass character varying(255) NOT NULL,
    recurring boolean NOT NULL
);


ALTER TABLE public.timetable OWNER TO postgres;

--
-- Name: timetable_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timetable_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timetable_serial_id_seq OWNER TO postgres;

--
-- Name: timetable_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.timetable_serial_id_seq OWNED BY public.timetable.serial_id;


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: credential id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential ALTER COLUMN id SET DEFAULT nextval('public.credential_id_seq'::regclass);


--
-- Name: event_flow id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_flow ALTER COLUMN id SET DEFAULT nextval('public.event_flow_id_seq'::regclass);


--
-- Name: payment serial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN serial_id SET DEFAULT nextval('public.payment_serial_id_seq'::regclass);


--
-- Name: personal_class serial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_class ALTER COLUMN serial_id SET DEFAULT nextval('public.personal_class_serial_id_seq'::regclass);


--
-- Name: timetable serial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable ALTER COLUMN serial_id SET DEFAULT nextval('public.timetable_serial_id_seq'::regclass);


--
-- Data for Name: accounting; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('Géza', 'Test comment in DB 2', '2018-05-09 10:00:00', 'time-table', 2);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('Béla', 'Test comment in DB 1', '2018-11-04 20:32:17.447245', 'time-table', 1);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'Test on personal-classes page', '2018-11-05 14:10:50.287', 'personal-classes', 7);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'Once more', '2019-03-05 14:18:47.486', 'personal-classes', 9);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'Once more', '2019-03-05 14:19:03.535', 'personal-classes', 10);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'jk', '2018-11-05 14:23:45.84', 'time-table', 11);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'sthg', '2018-11-05 14:30:36.158', 'time-table', 12);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'fdgdfg', '2018-11-05 14:30:59.381', 'personal-classes', 13);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'Parameterized query
If you are passing parameters to your queries you will want to avoid string concatenating parameters into the query text directly. This can (and often does) lead to sql injection vulnerabilities. node-postgres supports paramterized queries, passing your query text unaltered as well as your parameters to the PostgreSQL server where the parameters are safely substituted into the query with battle-tested parameter substitution code within the server itself.', '2018-11-05 14:31:59.532', 'personal-classes', 14);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'ffg', '2018-11-05 14:34:50.115', 'personal-classes', 15);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'btn-darkbtn-darkbtn-darkbtn-darkbtn-darkbtn-dark
btn-darkbtn-dark
v
btn-darkbtn-darkbtn-darkbtn-dark', '2018-11-05 14:38:08.241', 'time-table', 16);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();', '2018-11-05 14:39:02.977', 'time-table', 17);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
vthis.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
vthis.change.detectChanges();this.change.detectChanges();', '2018-11-05 14:40:24.575', 'time-table', 18);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'If someone hasn''t logged into your app yet, they''ll see this button, and clicking it will open a Login dialog, starting the login flow. People who have already logged in won''t see any button, or you can also choose to show a logout button to them.

If you show a logout button, when people use it to log out, they log out both from your app and from Facebook.

The Login button is only designed to work in connection with the JavaScript SDK — if you''re building a mobile app or can''t use our JavaScript SDK, you should follow the login flow guide for that type of app instead.

The Continue with Facebook button replaces earlier versions of the Login button. For more information, see Migration.', '2018-11-05 14:41:53.478', 'time-table', 19);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'If someone hasn''t logged into your app yet, they''ll see this button, and clicking it will open a Login dialog, starting the login flow. People who have already logged in won''t see any button, or you can also choose to show a logout button to them.

If you show a logout button, when people use it to log out, they log out both from your app and from Facebook.

The Login button is only designed to work in connection with the JavaScript SDK — if you''re building a mobile app or can''t use our JavaScript SDK, you should follow the login flow guide for that type of app instead.

The Continue with Facebook button replaces earlier versions of the Login button. For more information, see Migration.', '2018-11-05 14:43:25.742', 'personal-classes', 20);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', '<script>alert("Torpe buzi")</script>', '2018-11-05 15:17:28.629', 'time-table', 21);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'A random comment on UI', '2018-11-06 18:22:44.627', 'personal-classes', 22);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'fgxjhcjm', '2018-11-06 18:23:46.07', 'personal-classes', 23);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'tjjuztkjztdk', '2018-11-06 18:25:06.343', 'time-table', 24);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'tztuiuir', '2018-11-06 18:26:38.062', 'time-table', 25);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'fgfdgfdgfds old', '2018-11-06 18:48:17.032', 'personal-classes', 26);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'new comment', '2018-11-06 19:50:39.135', 'personal-classes', 27);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'sgrgdf', '2018-11-06 20:06:31.414', 'personal-classes', 28);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'dfgfd', '2018-11-06 20:06:33.915', 'personal-classes', 29);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'dfgfd', '2018-11-06 20:06:36.652', 'time-table', 30);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'zuzuz', '2018-11-06 23:05:22.355', 'time-table', 31);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'hjthjhgj', '2018-11-06 23:06:03.741', 'personal-classes', 32);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', 'rrr', '2018-11-06 23:06:25.451', 'personal-classes', 33);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('ADMIN', '--é.é', '2018-11-06 23:07:51.031', 'personal-classes', 34);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('Dániel Preszl', 'sdgd', '2018-11-06 23:09:38.609', 'personal-classes', 35);
INSERT INTO public.comment (name, comment, created_date, on_page, id) VALUES ('Dániel Preszl', 'You can provide multiple callback functions that behave just like middleware, except that these callbacks can invoke next(''route'') to bypass the remaining route callback(s). You can use this mechanism to impose pre-conditions on a route, then pass control to subsequent routes if there is no reason to proceed with the current route.
You can provide multiple callback functions that behave just like middleware, except that these callbacks can invoke next(''route'') to bypass the remaining route callback(s). You can use this mechanism to impose pre-conditions on a route, then pass control to subsequent routes if there is no reason to proceed with the current route.', '2018-11-07 08:33:28.905', 'personal-classes', 36);


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.credential (id, username, password, privilege, fb_reg, fb_id, email, uuid, token) VALUES (1, 'Anita', '07394191A668E62C9108540C12414571275873DB757BFC19EADC8425ED294847', 'ADMIN', false, NULL, NULL, NULL, NULL);
INSERT INTO public.credential (id, username, password, privilege, fb_reg, fb_id, email, uuid, token) VALUES (7, 'Danconescu', 'D9B5F58F0B38198293971865A14074F59EBA3E82595BECBE86AE51F1D9F1F65E', 'ADMIN', true, '2229075060496563', NULL, NULL, 'EAAZAK2bIUZBccBADBq40bkZBzar4Yfw1wE1qLFdIcJr7P9aZAZCIA8RE9whUvOZCnPaXQfTBWvzDSFk0okDGTbeMyrUi6ojoZAVUZAGCc1Mn6nkPe38KNo7jqFyAf8326ZApBKHKa2pRjCFgckTlPHQXyMQZA4L2cklsL7Awmm9ECAsqwKd6lx4dimmZC5jOfR3qllQ0zIz2KRY2wZDZD');
INSERT INTO public.credential (id, username, password, privilege, fb_reg, fb_id, email, uuid, token) VALUES (11, 'Csongor', 'D9B5F58F0B38198293971865A14074F59EBA3E82595BECBE86AE51F1D9F1F65E', 'ADMIN', false, NULL, NULL, NULL, NULL);
INSERT INTO public.credential (id, username, password, privilege, fb_reg, fb_id, email, uuid, token) VALUES (10, 'Robi', 'D9B5F58F0B38198293971865A14074F59EBA3E82595BECBE86AE51F1D9F1F65E', 'ADMIN', false, NULL, NULL, NULL, NULL);
INSERT INTO public.credential (id, username, password, privilege, fb_reg, fb_id, email, uuid, token) VALUES (12, 'TestUser', 'D9B5F58F0B38198293971865A14074F59EBA3E82595BECBE86AE51F1D9F1F65E', 'USER', false, NULL, NULL, NULL, NULL);


--
-- Data for Name: event_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_flow (source, priority, "timestamp", username, content, id) VALUES ('Personal Class : New Class', 1, '2019-03-27 10:41:20', 'Dániel Preszl', '{"start":"2019-03-25T12:30:00.000Z","end":"2019-03-25T13:15:00.000Z","title":"Preszl Dániel órázik Csongornál","color":{"primary":"rgba(76, 81, 109, 0.8)","secondary":"rgba(15, 82, 186, 0.8)"},"actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}],"id":"2","recurring":true,"cssClass":"","serial_id":"30"}', 23);
INSERT INTO public.event_flow (source, priority, "timestamp", username, content, id) VALUES ('Personal Class : New Class', 1, '2019-03-27 11:30:41', 'Dániel Preszl', '{"start":"2019-03-26T08:45:00.000Z","end":"2019-03-26T09:30:00.000Z","title":"[object Object]al","color":{"primary":"rgba(15, 82, 186, 0.8)","secondary":"rgba(15, 82, 186, 0.8)"},"actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}],"id":"2","recurring":true,"cssClass":"","serial_id":"31"}', 24);
INSERT INTO public.event_flow (source, priority, "timestamp", username, content, id) VALUES ('Personal Class : Delete Class', 1, '2019-03-27 11:31:40', 'Dániel Preszl', '{"start":"2019-03-26T08:45:00.000Z","title":"[object Object]al","color":{"primary":"rgba(15, 82, 186, 0.8)","secondary":"rgba(15, 82, 186, 0.8)"},"id":"2","serial_id":"31","recurring":true,"last_paid_class":null,"end":"2019-03-26T09:30:00.000Z","cssClass":"","actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}]}', 25);
INSERT INTO public.event_flow (source, priority, "timestamp", username, content, id) VALUES ('Personal Class : New Class', 1, '2019-03-27 11:31:53', 'Dániel Preszl', '{"start":"2019-03-26T08:30:00.000Z","end":"2019-03-26T09:15:00.000Z","title":"Preszl Dániel órázik Csongornál Evitaal","color":{"primary":"rgba(70, 130, 180, 0.8)","secondary":"rgba(70, 130, 180, 0.8)"},"actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}],"id":"2","recurring":true,"cssClass":"","serial_id":"32"}', 26);
INSERT INTO public.event_flow (source, priority, "timestamp", username, content, id) VALUES ('Personal Class : New Class', 2, '2019-03-27 15:55:57', 'Danconescu', '{"event":"Különóra Federicoval","date":"2019-03-27T14:55:57.476Z"}', 27);


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment (serial_id, username, lastpaid) VALUES (1, 'Dansator DB 1', '2019-03-01T09:00:00.000Z');


--
-- Data for Name: personal_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('2019-03-25T12:30:00.000Z', '2019-03-25T13:15:00.000Z', 'Preszl Dániel órázik Csongornál', '{"primary":"rgba(76, 81, 109, 0.8)","secondary":"rgba(15, 82, 186, 0.8)"}', '2', '', 30, true, '2019-03-25T12:30:00.000Z');
INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('2019-03-26T08:30:00.000Z', '2019-03-26T09:15:00.000Z', 'Preszl Dániel órázik Csongornál Evitaal', '{"primary":"rgba(70, 130, 180, 0.8)","secondary":"rgba(70, 130, 180, 0.8)"}', '2', '', 32, true, '2019-03-26T08:30:00.000Z');
INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('Mon Nov 05 2018 14:30:00', 'Mon Nov 05 2018 15:15:00', 'Dani és Ági órázik Anitával', '{"primary": "#cc98e5", "secondary": "#cf98ef"}', '1', 'event-element', 1, true, '2019-03-07T09:15:00.000Z');
INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('2018-11-08T08:30:00.000Z', '2018-11-08T09:15:00.000Z', 'Dani és Ági órázik Robinál', '{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"}', '3', '', 26, true, '2018-12-06T09:15:00.000Z');
INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('Fri Nov 09 2018 17:15:00', 'Fri Nov 09 2018 18:00:00', 'Máté és Kinga órázik Csongorral', '{"primary": "#6495ed", "secondary": "#6495ff"}', '2', 'event-element', 3, false, '2018-12-13T09:15:00.000Z');
INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('Tue Nov 06 2018 14:30:00', 'Tue Nov 06 2018 15:15:00', 'Robi és Vivi órázik Robival', '{"primary": "#ffd700", "secondary": "#ffd755"}', '3', 'event-element', 2, true, '2019-02-21T09:15:00.000Z');
INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('2018-11-11T11:30:00.000Z', '2018-11-11T12:15:00.000Z', 'dfgfdg órázik Robinál', '{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"}', '3', '', 28, false, '2018-11-15T09:15:00.000Z');
INSERT INTO public.personal_class (start, end_, title, color, id, cssclass, serial_id, recurring, last_paid_class) VALUES ('2018-11-07T10:15:00.000Z', '2018-11-07T11:00:00.000Z', 'Dániel Preszl órázik Anitánál', '{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"}', '1', '', 29, true, '2018-12-13T09:15:00.000Z');


--
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (1, '[0, 17, 30]', '[0, 18, 30]', 'Erőnléti Kittivel', '{"primary": "#be4a47", "secondary": "#ff4a47"}', 'Erőnléti Kittivel555', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (2, '[0, 18, 30]', '[0, 19, 30]', 'Standard Edzés', '{"primary": "#6495ed", "secondary": "#6495ff"}', 'Standard Edzés465', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (4, '[2, 17, 30]', '[2, 18, 30]', 'Erőnléti Ádámmal', '{"primary": "#8b3a3a", "secondary": "#cb3a3a"}', 'Erőnléti Ádámmal084', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (3, '[1, 18, 30]', '[1, 19, 30]', 'Standard Közös óra', '{"primary": "#03396c", "secondary": "#03398f"}', 'Standard Közös óra10185', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (5, '[2, 18, 30]', '[2, 19, 30]', 'Latin Edzés', '{"primary": "#ed7f00", "secondary": "#ff7f00"}', 'Latin Edzés65465', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (6, '[3, 17, 30]', '[3, 18, 30]', 'Zumba', '{"primary": "#cc98e5", "secondary": "#cf98ef"}', 'Zumba123', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (7, '[3, 18, 30]', '[3, 19, 30]', 'Latin Közös óra', '{"primary": "#ffd700", "secondary": "#ffd755"}', 'Latin Közös óra1646', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (8, '[4, 17, 30]', '[4, 18, 30]', 'Standard Edzés', '{"primary": "#6495ed", "secondary": "#6495ff"}', 'Standard Edzés467', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (9, '[4, 18, 30]', '[4, 19, 30]', 'Latin Edzés', '{"primary": "#ed7f00", "secondary": "#ff7f00"}', 'Latin Edzés65477', 'event-element', true);
INSERT INTO public.timetable (serial_id, start, end_, title, color, id, cssclass, recurring) VALUES (185071050, '2019-03-28T20:00:00.000Z', '2019-03-28T22:00:00.000Z', 'Különóra Federicoval', '{"primary":"#1919c8","secondary":"#191970"}', 'Különóra Federicoval0.8420191233665311', 'special-event', false);


--
-- Name: accounting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounting_id_seq', 1, false);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 36, true);


--
-- Name: credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credential_id_seq', 13, true);


--
-- Name: event_flow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_flow_id_seq', 27, true);


--
-- Name: payment_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_serial_id_seq', 1, false);


--
-- Name: personal_class_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_class_serial_id_seq', 33, true);


--
-- Name: timetable_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timetable_serial_id_seq', 2, true);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: credential credential_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT credential_pkey PRIMARY KEY (id);


--
-- Name: event_flow event_flow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_flow
    ADD CONSTRAINT event_flow_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (serial_id);


--
-- Name: personal_class personal_class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_class
    ADD CONSTRAINT personal_class_pkey PRIMARY KEY (serial_id);


--
-- Name: timetable timetable_end__key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_end__key UNIQUE (end_);


--
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (serial_id);


--
-- Name: timetable timetable_start_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_start_key UNIQUE (start);


--
-- PostgreSQL database dump complete
--

