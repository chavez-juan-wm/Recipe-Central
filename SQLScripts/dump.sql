--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-12-02 10:11:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 16620)
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmarks (
    userid integer NOT NULL,
    recipeid integer NOT NULL
);


ALTER TABLE public.bookmarks OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16607)
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes (
    recipeid integer NOT NULL,
    chefid integer NOT NULL,
    recipename text,
    foodtype text,
    pictureurl text,
    ingredients text[],
    protein real,
    carbs real,
    fat real,
    sugars real
);


ALTER TABLE public.recipes OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16606)
-- Name: recipes_recipeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_recipeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipeid_seq OWNER TO postgres;

--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 211
-- Name: recipes_recipeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_recipeid_seq OWNED BY public.recipes.recipeid;


--
-- TOC entry 210 (class 1259 OID 16595)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username text,
    email text,
    password text,
    rating real DEFAULT 0
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16594)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 3175 (class 2604 OID 16610)
-- Name: recipes recipeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes ALTER COLUMN recipeid SET DEFAULT nextval('public.recipes_recipeid_seq'::regclass);


--
-- TOC entry 3173 (class 2604 OID 16598)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 3330 (class 0 OID 16620)
-- Dependencies: 213
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (userid, recipeid) FROM stdin;
31	42
31	18
31	21
30	23
30	10
30	25
2	20
2	43
2	1
2	31
52	2
52	53
39	10
39	57
39	39
39	55
39	19
39	1
38	11
38	15
38	33
3	1
3	14
3	39
3	25
3	30
3	20
12	58
12	35
12	31
12	12
18	46
18	23
18	45
18	37
18	33
21	48
21	18
21	53
21	29
29	15
29	26
29	35
24	1
24	37
24	42
14	40
14	56
14	25
14	60
14	31
8	47
8	55
8	12
8	38
8	58
32	52
32	9
32	58
25	7
25	25
25	46
44	57
44	23
49	55
49	11
49	45
28	41
28	3
28	46
28	20
28	37
28	28
34	20
34	43
34	45
34	37
34	38
5	17
5	38
5	9
5	4
53	54
53	3
53	16
53	15
10	41
10	11
10	29
10	21
10	45
10	4
46	12
46	21
13	18
13	52
13	22
45	50
45	57
45	27
4	3
4	46
4	39
48	24
48	2
48	49
48	43
1	4
1	7
1	20
1	34
1	13
59	49
59	26
36	42
36	13
36	53
55	51
55	17
60	50
60	7
51	51
51	27
17	51
17	29
33	25
33	52
33	16
33	57
33	28
50	34
50	24
50	47
50	45
40	34
40	25
40	46
40	10
40	60
40	54
40	23
40	41
37	3
37	13
37	7
11	40
11	55
11	13
11	29
42	3
42	11
42	33
15	38
15	59
15	2
15	28
15	11
15	45
15	5
26	43
26	45
26	56
27	5
27	55
27	56
27	42
54	49
22	1
22	3
58	10
58	11
58	47
58	5
58	16
9	5
9	12
9	9
9	22
6	12
6	22
35	6
35	53
43	14
43	24
20	12
20	33
7	55
7	25
23	33
23	40
23	5
23	23
57	3
57	32
73	10
74	62
74	61
74	54
74	57
74	8
74	41
74	48
76	62
76	53
74	60
74	53
74	79
\.


--
-- TOC entry 3329 (class 0 OID 16607)
-- Dependencies: 212
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (recipeid, chefid, recipename, foodtype, pictureurl, ingredients, protein, carbs, fat, sugars) FROM stdin;
1	1	Instant Pot?? Tomato and Beef Sauce	Side Dish	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5345297.jpg	{"1 pound lean ground beef","1 teaspoon salt","?? teaspoon freshly ground black pepper","1 large onion, finely diced","4 cloves garlic, minced","2 teaspoons Italian seasoning","?? cup dry red wine","1 (24 ounce) container crushed tomatoes","1 (28 ounce) can whole peeled San Marzano tomatoes, crushed with a fork","2 teaspoons lemon juice"}	16.9	17.3	11	4.3
2	1	Bren's Italian Meatballs	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F3708702.jpg	{"?? cup fresh bread crumbs","?? cup grated pecorino Romano cheese","2 large cloves garlic, minced","1 tablespoon chopped fresh parsley","?? teaspoon ground black pepper","1 pinch red chili pepper flakes","1 egg","1 pound lean ground beef"}	21.8	3.6	16.8	0.4
3	5	Bon Appetit's Meatballs	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2490106.jpg	{"1????? pounds coarsely ground pork","1????? pounds sweet Italian sausage without fennel, casings removed","1????? pounds ground beef sirloin","1????? pounds ground beef chuck","?? loaf day-old (hard) Italian bread, torn into chunks","1 (32 ounce) carton low-sodium chicken broth","1 whole head garlic, minced","1 cup packed fresh Italian parsley leaves","4 large eggs, beaten","8 ounces Pecorino Romano cheese (such as Locatelli??), grated","?? cup extra-virgin olive oil","2 tablespoons unsalted butter"}	47	21.5	47.2	1.2
4	6	Soft Zucchini Spice Cookies	Fruits and Vegetables	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F8272918.jpg	{"?? cup butter, softened","1 cup packed brown sugar","1 egg","1????? cups all-purpose flour","2 teaspoons baking powder","?? teaspoon salt","?? teaspoon ground cinnamon","?? teaspoon ground nutmeg","??? teaspoon ground cloves","?? cup milk","1????? cups grated zucchini","?? cup chopped walnuts","?? cup raisins","1 teaspoon orange zest"}	1	9.6	2.9	5.5
5	7	Just Like Wendy's?? Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6278897.jpg	{"2 tablespoons olive oil","2 pounds ground beef","2 stalks celery, chopped","1 onion, chopped","1 green bell pepper, chopped","3 (14 ounce) cans stewed tomatoes","1 (10 ounce) can diced tomatoes with green chiles (such as RO*TEL)","1 (14 ounce) can tomato sauce","1 cup water","2 (1.25 ounce) packages chili seasoning (such as McCormick?? Mild Chili Seasoning Mix)","1 (14 ounce) can kidney beans, undrained","1 (14 ounce) can pinto beans, undrained"," salt and ground black pepper to taste","1 tablespoon white vinegar, or more to taste"}	22.6	28.8	14.8	8.3
6	8	Chocolate Zucchini Cookies	Fruits and Vegetables	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1036633.jpg	{"?? cup butter flavored shortening","?? cup white sugar","?? cup brown sugar","1 egg","1 teaspoon vanilla extract","2????? cups all-purpose flour","??? cup unsweetened cocoa powder","1 teaspoon baking soda","?? teaspoon salt","1????? cups grated zucchini"}	0.9	8.5	2.5	3.7
7	16	My Favorite Sloppy Joes	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F994391.jpg	{"1 pound lean ground beef","1 cup ketchup","?? cup dried minced onion","3 tablespoons brown sugar, or to taste","2 tablespoons spicy brown mustard","1 tablespoon Worcestershire sauce, or more to taste","1 tablespoon liquid smoke flavoring","1 teaspoon minced garlic","1 cup beef broth"," salt and ground black pepper to taste"}	16.1	19.6	12	16.9
8	17	Grandma's Chocolate Zucchini Brownies	Fruits and Vegetables	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2296609.jpg	{"2 cups all-purpose flour","2 tablespoons unsweetened cocoa powder","1 teaspoon baking soda","?? teaspoon salt","?? cup butter","1????? cups white sugar","2 eggs","1 teaspoon vanilla extract","2????? cups shredded zucchini","2 tablespoons white sugar","1 cup chopped walnuts (Optional)   1 cup chocolate chips"}	3.5	32.8	11.7	21.3
9	19	Pork Rites (Taverns)	Meat and Poultry	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1114722.jpg	{"2 pounds ground pork","1 cup ketchup","?? cup water","2 tablespoons vinegar","1 tablespoon brown sugar","1 teaspoon dry mustard","1 teaspoon salt","12 hamburger buns"}	17.5	27.8	13.2	5.7
10	20	Loose Meat on a Bun, Restaurant Style	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F123542.jpg	{"3 pounds ground beef","?? cup minced onion","3 tablespoons Worcestershire sauce","4 cups beef broth","1 teaspoon salt","1 teaspoon ground black pepper","2 teaspoons butter","12 hamburger buns, split"}	23.6	22.9	16.4	0.6
11	23	Homemade Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F3953159.jpg	{"2 tablespoons olive oil","1 large onion, chopped","2 cloves garlic, minced, or more to taste","2 pounds lean ground beef","2 (16 ounce) cans kidney beans, rinsed and drained","1 (28 ounce) can diced tomatoes","1 (15 ounce) can tomato puree","1 cup water","1 (4 ounce) can chopped green chile peppers","2 tablespoons mild chili powder","2 teaspoons salt","2 teaspoons ground cumin","1 teaspoon ground black pepper"}	18.8	19.6	13.3	4.3
12	24	Beer Burgers	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F620225.jpg	{"1 pound ground beef","1 small onion, finely chopped","3 cloves garlic, minced","1 tablespoon Worcestershire sauce","1 teaspoon salt","?? teaspoon ground black pepper","?? cup beer"}	19.5	3.8	13.7	1.2
13	25	Sloppy Joe Sandwiches	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2296596.jpg	{"?? pound ground beef","?? onion, chopped","?? cup ketchup","2 tablespoons water","1 tablespoon brown sugar","1 teaspoon Worcestershire sauce","1 teaspoon prepared mustard","1 teaspoon white vinegar","1 teaspoon chili powder","?? teaspoon garlic powder","?? teaspoon onion powder","?? teaspoon salt","2 hamburger buns, split"}	24	47.8	20.3	22
29	46	Easy Homemade Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2905812.jpg	{"1 pound ground beef","1 onion, chopped","1 (14.5 ounce) can stewed tomatoes","1 (15 ounce) can tomato sauce","1 (15 ounce) can kidney beans","1????? cups water","1 pinch chili powder","1 pinch garlic powder"," salt and pepper to taste"}	30.6	48.8	9.2	4.4
14	26	It's Chili by George!!	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5243640.jpg	{"2 pounds lean ground beef","1 (46 fluid ounce) can tomato juice","1 (29 ounce) can tomato sauce","1 (15 ounce) can kidney beans, drained and rinsed","1 (15 ounce) can pinto beans, drained and rinsed","1????? cups chopped onion","?? cup chopped green bell pepper","??? teaspoon ground cayenne pepper","?? teaspoon white sugar","?? teaspoon dried oregano","?? teaspoon ground black pepper","1 teaspoon salt","1????? teaspoons ground cumin","?? cup chili powder"}	22.3	25.5	13.7	9.4
15	27	Juicy Lucy Burgers	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F995492.jpg	{"1????? pounds ground beef","1 tablespoon Worcestershire sauce","?? teaspoon garlic salt","1 teaspoon black pepper","4 slices American cheese (such as Kraft??)","4 hamburger buns, split"}	38.1	23.4	37.5	0.6
16	28	Instant Pot?? Chicken and Gravy	Meat and Poultry	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6996918.jpg	{"?? teaspoon salt","?? teaspoon paprika","?? teaspoon thyme","?? teaspoon ground black pepper","?? teaspoon garlic powder","??? teaspoon sage","2 (10 ounce) boneless, skinless chicken breasts","1 tablespoon olive oil","1 cup chicken stock"," aluminum foil","2 tablespoons cold water","2 tablespoons cornstarch","1 pinch salt and ground black pepper to taste"}	59.8	9.1	14	0.8
17	29	Instant Pot?? Chicken Congee	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6933650.jpg	{"1 cup uncooked short-grain white rice","1 tablespoon olive oil","14 ounces boneless, skinless chicken breast","6 cups chicken broth","1 (2 inch) piece grated fresh ginger","1 ear fresh corn, husked"," salt and ground black pepper to taste"}	18.3	32.5	9.7	2.1
18	31	Chris' Bay Area Burger	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F407555.jpg	{"1 pound ground beef","2 cloves garlic, minced","2 tablespoons extra virgin olive oil","1????? teaspoons salt","1 teaspoon freshly ground black pepper","?? teaspoon dried basil leaves","4 hamburger buns, split"}	22.9	22.6	6.8	22.6
19	32	Danish Meatballs with Dill Sauce	Appetizers and Snacks	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F381832.jpg	{"1 pound ground beef","?? pound ground pork","?? pound ground veal","2 teaspoons salt","?? teaspoon ground black pepper","2 eggs","??? cup finely chopped onion","?? cup heavy cream","1 cup dry bread crumbs","1 cup butter","?? cup all-purpose flour","2 cups chicken broth","2 cups sour cream","?? cup chopped fresh dill"}	16.9	11.1	37.6	1.1
20	33	Spanish-Style Albondigas in a Sunny Mediterranean Sauce	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F4559146.jpg	{"?? pound ground beef","?? pound ground pork","2 tablespoons chopped spring onions","2 tablespoons chopped fresh oregano","1 clove garlic, finely chopped","1 tablespoon Worcestershire sauce, or to taste","1 tablespoon chopped fresh flat-leaf parsley"," salt and ground black pepper to taste","1?????? cups fresh, white bread crumbs, divided"," extra-virgin olive oil for frying"}	20.3	31.2	55.3	6.5
21	34	Vegan Zucchini Brownies	Fruits and Vegetables	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F9158563.jpg	{"cooking spray","1 cup white sugar","?? cup brown sugar","?? cup olive oil","1 tablespoon vanilla extract","2 cups all-purpose flour","?? cup cocoa powder (such as Hershey's??)","1????? teaspoons baking soda","1 teaspoon salt","3 cups shredded zucchini","1 cup vegan chocolate chips"}	2.9	37.8	10.6	23.2
22	35	Italian Spaghetti Sauce with Meatballs	Side Dish	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5864844.jpg	{"1 pound lean ground beef","1 cup fresh bread crumbs","1 tablespoon dried parsley","1 tablespoon grated Parmesan cheese","?? teaspoon ground black pepper","??? teaspoon garlic powder","1 egg, beaten"}	18.9	23	21.2	11.1
23	36	Healthier Sloppy Joes II	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F876321.jpg	{"1 pound lean ground beef","?? cup chopped onion","?? cup chopped green bell pepper","2 carrots, finely chopped","2 cloves garlic, minced","1 teaspoon prepared yellow mustard","?? cup ketchup","1 tablespoon brown sugar"," salt and ground black pepper to taste"}	14.3	13	15.8	10.4
24	37	Garlic and Onion Burgers	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1055214.jpg	{"2 pounds ground beef","1 tablespoon Worcestershire sauce","3 cloves garlic, minced","?? cup minced onion","1 teaspoon salt","?? teaspoon ground black pepper","1 teaspoon Italian-style seasoning"}	30.5	3.1	48.3	1.1
25	40	Almost White Castle?? Hamburgers	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5248292.jpg	{"1????? pounds ground chuck","??? cup plain bread crumbs","1 egg","1 (1 ounce) package dry onion soup mix","2 tablespoons water","?? teaspoon ground black pepper","24 small square dinner rolls"}	8.3	16.4	6.2	1.7
26	42	Delicious Grilled Hamburgers	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F625104.jpg	{"1 pound lean ground beef","1 tablespoon Worcestershire sauce","1 tablespoon liquid smoke flavoring","1 teaspoon garlic powder","1 tablespoon olive oil"," seasoned salt to taste"}	28.2	1.9	30	0.8
27	43	Spicy Zucchini Oatmeal Cookies	Fruits and Vegetables	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1570056.jpg	{"1????? cups all-purpose flour","?? teaspoon baking soda","1????? teaspoons ground cinnamon","?? teaspoon ground cloves","?? cup butter, softened","??? cup packed brown sugar","1 egg","1 teaspoon vanilla extract","1 cup quick cooking oats","1 cup shredded zucchini","?? cup raisins"}	1.3	12.8	3.5	6.3
28	44	Easy Slow Cooker Meatballs	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F4528723.jpg	{"1????? pounds ground beef","1????? cups Italian seasoned bread crumbs","?? cup chopped fresh parsley","2 cloves garlic, minced","1 medium yellow onion, chopped","1 egg, beaten","1 (28 ounce) jar spaghetti sauce","1 (16 ounce) can crushed tomatoes","1 (14.25 ounce) can tomato puree"}	10.6	18.2	7.2	6.2
30	47	Boilermaker Tailgate Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F890638.jpg	{"2 pounds ground beef chuck","1 pound bulk Italian sausage","3 (15 ounce) cans chili beans, drained","1 (15 ounce) can chili beans in spicy sauce","2 (28 ounce) cans diced tomatoes with juice","1 (6 ounce) can tomato paste","1 large yellow onion, chopped","3 stalks celery, chopped","1 green bell pepper, seeded and chopped","1 red bell pepper, seeded and chopped","2 green chile peppers, seeded and chopped","1 tablespoon bacon bits","4 cubes beef bouillon","?? cup beer","?? cup chili powder","1 tablespoon Worcestershire sauce","1 tablespoon minced garlic","1 tablespoon dried oregano","2 teaspoons ground cumin","2 teaspoons hot pepper sauce (e.g. Tabasco???)","1 teaspoon dried basil","1 teaspoon salt","1 teaspoon ground black pepper","1 teaspoon cayenne pepper","1 teaspoon paprika","1 teaspoon white sugar","1 (10.5 ounce) bag corn chips such as Fritos??","1 (8 ounce) package shredded Cheddar cheese"}	30.8	55.3	30.1	11.8
31	48	Quick Chili I	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F870042.jpg	{"2 pounds ground beef","1 onion, finely diced","3 cloves garlic, minced","1 (14.5 ounce) can diced tomatoes","2 (14.5 ounce) cans diced tomatoes with green chile peppers","1 (8 ounce) can tomato sauce","1 cup water","1 (15 ounce) can kidney beans","1 (15 ounce) can pinto beans","2 tablespoons chili powder","1 tablespoon ground cumin","2 tablespoons white sugar","1 tablespoon salt","1 teaspoon ground black pepper","1 tablespoon hot pepper sauce"}	25.6	26.9	31.3	6.3
32	49	Picadillo	Meat and Poultry	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5504998.jpg	{"2 tablespoons olive oil","1 pound ground beef","?? pound chorizo sausage, chopped","1 large onion, chopped","?? cup chopped red bell pepper","2 cloves garlic, chopped","1 tablespoon ground cumin","2 teaspoons chili powder","1 teaspoon dried oregano","1 teaspoon paprika","?? teaspoon cayenne pepper","?? teaspoon ground cinnamon","1????? cups canned diced tomatoes","?? cup beef stock","1 tablespoon white sugar","?? cup raisins","?? cup chopped pimento-stuffed green olives","2 tablespoons apple cider vinegar","1 tablespoon capers, drained","??? cup slivered almonds, toasted","1 tablespoon lime juice"}	25.5	22.6	32.7	14.2
33	53	The Perfect Basic Burger	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2294328.jpg	{"1 egg","?? teaspoon salt","?? teaspoon ground black pepper","1 pound ground beef","?? cup fine dry bread crumbs"}	27.4	10	17.8	0.9
34	54	Instant Pot?? Quick and Easy Outlaw Chili Beans	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F4551168.jpg	{"1 tablespoon vegetable oil","1????? pounds lean ground sirloin","1 onion, diced","3 stalks celery, diced","4 cloves garlic, minced","2 (15 ounce) cans chili beans, undrained","1 (29 ounce) can pinto beans, rinsed and drained","1 (29 ounce) can tomato sauce","2 (4 ounce) cans diced green chiles, undrained","2 tablespoons chili powder","1 tablespoon cider vinegar","1 tablespoon chile-garlic sauce (such as Huy Fong Foods??), or to taste","1 teaspoon dried oregano","?? teaspoon ground cumin"}	39.6	62.1	19.1	13.4
35	55	Slow Cooker Chili II	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F196638.jpg	{"1 pound ground beef","?? cup diced onion","?? cup diced celery","?? cup diced green bell pepper","2 cloves garlic, minced","2 (10.75 ounce) cans tomato puree","1 (15 ounce) can kidney beans with liquid","1 (15 ounce) can kidney beans, drained","1 (15 ounce) can cannellini beans with liquid","?? tablespoon chili powder","?? teaspoon dried parsley","1 teaspoon salt","?? teaspoon dried basil","?? teaspoon dried oregano","?? teaspoon ground black pepper","??? teaspoon hot pepper sauce"}	18.9	33.4	7.6	4.9
36	56	Homemade Sloppy Joes	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F3793689.jpg	{"1????? pounds extra lean ground beef","?? onion, diced","2 cloves garlic, minced","1 green pepper, diced","1 cup water","?? cup ketchup","1 dash Worcestershire sauce","2 tablespoons brown sugar","1 teaspoon Dijon mustard","1????? teaspoons salt, or to taste","?? teaspoon ground black pepper","1 cup water","1 pinch cayenne pepper to taste"}	21.5	14.4	11.9	12.1
37	58	The Twenty Dollar Burger	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F9278800.jpg	{"1 tablespoon butter","1 small red onion, diced","1 tablespoon minced garlic","?? cup plain lowfat yogurt","1 teaspoon salt","1 teaspoon black pepper","1 teaspoon cayenne pepper","1 teaspoon mustard powder","1 teaspoon garlic powder","1 tablespoon horseradish","1 tablespoon chopped fresh parsley","1 tablespoon chopped fresh cilantro","2 tablespoons Worcestershire sauce","2 tablespoons low-sodium soy sauce","1 tablespoon chipotle-flavored hot sauce","2 pounds lean ground beef"}	28	6.5	21	3.7
38	60	Best Damn Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1060867.jpg	{"4 tablespoons olive oil","1 yellow onion, chopped","1 red bell pepper, chopped","1 Anaheim chile pepper, chopped","2 red jalapeno pepper, chopped","4 garlic cloves, minced","2????? pounds lean ground beef","?? cup Worcestershire sauce","1 pinch garlic powder, or to taste","2 beef bouillon cubes","1 (12 fluid ounce) can or bottle light beer (such as Coors??)","1 (28 ounce) can crushed San Marzano tomatoes","1 (14.5 ounce) can fire-roasted diced tomatoes","1 (12 ounce) can tomato paste","?? cup white wine","2 tablespoons chili powder","2 tablespoons ground cumin","1 tablespoon brown sugar","1 tablespoon chipotle pepper sauce","2????? teaspoons dried basil","1????? teaspoons smoked paprika","1 teaspoon salt","?? teaspoon dried oregano","?? teaspoon ground black pepper","2 (16 ounce) cans dark red kidney beans (such as Bush's??)","1 cup sour cream","3 tablespoons chopped fresh cilantro","?? teaspoon ground cumin"}	25.2	27.6	21.1	7.4
52	5	Teriyaki Chicken Meatballs	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F4540170.jpg	{"5 ounces ground chicken","2 spring onions, chopped","1 tablespoon sake (Japanese rice wine)","1 tablespoon water","1 tablespoon cornstarch","1????? teaspoons grated fresh ginger","1 teaspoon soy sauce","2 tablespoons vegetable oil, or more as needed","4 shiitake mushrooms, cut in half","1????? ounces daikon (Japanese radish), sliced"}	9.4	10.7	7.3	6.9
39	1	Zucchini-Coconut Cookie Bars	Fruits and Vegetables	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5637451.jpg	{"?? cup margarine, softened","?? cup white sugar","?? cup packed brown sugar","2 eggs","1 teaspoon vanilla extract","1????? cups all-purpose flour","?? teaspoon salt","1????? teaspoons baking powder","?? cup flaked coconut","?? cup chopped pitted dates","?? cup raisins","2 cups grated zucchini","1 tablespoon margarine, melted","2 tablespoons milk","1 teaspoon vanilla extract","?? teaspoon ground cinnamon","1 cup confectioners' sugar","1 cup finely chopped walnuts"}	1.4	15.1	5.2	10.2
40	5	Margaret's Keftedes (Greek Meatballs)	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F9273184.jpg	{"4 slices white bread, torn into pieces","2 tablespoons milk","1 clove garlic","1 onion, quartered","4 teaspoons dried mint","1 teaspoon salt"," ground black pepper to taste","?? pound ground beef","?? pound ground lamb","4 eggs","?? cup all-purpose flour for dredging"," vegetable oil for frying"}	29.7	28.6	31.5	3
41	6	Slider-Style Mini Burgers	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6967288.jpg	{"2 pounds ground beef","1 (1.25 ounce) envelope onion soup mix","?? cup mayonnaise","2 cups shredded Cheddar cheese","24 dinner rolls, split","?? cup sliced pickles (Optional)"}	12	16.1	13.2	1.8
42	1	Christina's Slow Cooker Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2032286.jpg	{"3 pounds ground beef","2 (14.5 ounce) cans diced tomatoes, or more to taste","2 (6 ounce) cans tomato paste","?? cup chili powder","2 tablespoons dried oregano","2 tablespoons ground cumin","1 tablespoon chipotle pepper powder","1 tablespoon cayenne pepper","3 (14.5 ounce) cans kidney beans, rinsed and drained","4 cups chopped onions","4 cups chopped bell peppers","3 jalapeno peppers, chopped","2 cloves garlic, minced, or more to taste"}	20.7	24.4	14.4	6.3
43	1	My Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1726661.jpg	{"2 pounds ground beef","2 onions, chopped","4 cloves garlic, minced","2 tablespoons chili powder","2 teaspoons salt","2 teaspoons dried oregano","4 (14.5 ounce) cans stewed tomatoes","1 (15 ounce) can tomato sauce","1 (15 ounce) can kidney beans with liquid"}	24.9	27.9	31.2	10.6
44	1	Frosted Zucchini Brownies	Fruits and Vegetables	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2606082.jpg	{"2 cups white sugar","1????? cups canola oil","4 large eggs","2 cups all-purpose flour","?? cup unsweetened cocoa powder","2 teaspoons baking soda","1 teaspoon ground cinnamon","1 teaspoon salt","1 teaspoon vanilla extract","3 cups grated zucchini","1 cup chopped nuts"}	4.3	45.3	24.6	33.1
45	5	Instant Pot?? Red Thai Curry Chicken	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5299902.jpg	{"1 tablespoon cooking oil","2 tablespoons red curry paste, or more to taste","1????? pounds thin chicken breasts, cut into 1-inch strips","1 (14 ounce) can unsweetened light coconut milk","1 tablespoon fish sauce, or more to taste","1 tablespoon palm sugar","1 cup sliced yellow onion","1 cup sliced red bell pepper","1 cup sliced yellow bell pepper","1 cup sliced orange bell pepper"}	24.5	20.4	22	6.5
46	6	Instant Pot?? Pork Chops	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6501901.jpg	{"4 pork chops","3 tablespoons butter","1 (1 ounce) package dry onion soup mix (such as Lipton??)","1 cup apple juice"}	14.9	11.6	13.1	7.1
47	1	Chef John's Turkey Sloppy Joes	Meat and Poultry	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1259534.jpg	{"2 tablespoons butter","1 onion, diced"," salt and ground black pepper to taste","1????? pounds ground turkey","?? cup cold water","?? cup ketchup","1????? tablespoons brown sugar","?? teaspoon cayenne pepper, or to taste","?? teaspoon Worcestershire sauce","?? teaspoon unsweetened cocoa powder","1 cup water, or as needed","6 hamburger buns, split","??? cup chopped green onions","?? cup shredded white Cheddar cheese"}	25.9	36.8	16.5	11.9
48	5	Instant Pot?? Pulled Pork Sandwiches	Side Dish	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5799283.jpg	{"1 tablespoon smoked paprika","1????? teaspoons firmly packed light brown sugar","1 teaspoon salt","?? teaspoon ground black pepper","2 pounds boneless pork loin roast, cut into 1-inch cubes","1 tablespoon olive oil","1????? cups barbeque sauce","1 cup water","2 (12 count) packages Hawaiian bread rolls (such as King's??)"}	55.6	144.4	5	13.1
49	5	Instant Pot?? Moroccan Chicken Tagine	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6741502.jpg	{"2 tablespoons minced fresh garlic","1????? teaspoons paprika","?? teaspoon ground ginger","?? teaspoon ground turmeric","??? teaspoon saffron powder","1????? pounds skinless, boneless chicken breasts, cut into bite-sized pieces","1 preserved lemon","2 tablespoons extra-virgin olive oil","2 tablespoons butter","2 medium red onions, sliced","1 cinnamon stick","1 cup pitted and halved Mediterranean olives","1 cup chicken broth","1 tablespoon chopped fresh flat-leaf parsley","1 tablespoon chopped fresh cilantro"}	24.6	8.7	13.8	2.3
50	5	Turkey and Rice Meatballs (Albondigas)	Meat and Poultry	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2941015.jpg	{"1 pound ground turkey thigh meat","1 cup packed, cooked white long grain rice","3 cloves crushed garlic","?? cup chopped Italian flat leaf parsley","1 large egg","2 teaspoons kosher salt","1 teaspoon smoked paprika","1 teaspoon ground cumin","?? teaspoon freshly ground black pepper","?? teaspoon dried oregano","??? teaspoon cayenne pepper","1 tablespoon olive oil"}	19.1	15.1	14.3	4.9
51	5	Vegetarian Sloppy Joes	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F422585.jpg	{"?? cup vegetable oil","?? cup minced onion","2 (8 ounce) packages tempeh","?? cup minced green bell pepper","2 cloves garlic, minced","?? cup tomato sauce","1 tablespoon vegetarian Worcestershire sauce","1 tablespoon honey","1 tablespoon blackstrap molasses","?? teaspoon cayenne pepper","?? teaspoon celery seed","?? teaspoon ground cumin","?? teaspoon salt","?? teaspoon ground coriander","?? teaspoon dried thyme","?? teaspoon oregano","?? teaspoon paprika","1 pinch ground black pepper"," hamburger buns"}	18.3	37.3	19.6	8.8
53	5	Air Fryer Meatballs	Meat and Poultry	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F8096931.jpg	{"16 ounces lean ground beef","4 ounces ground pork","1 teaspoon Italian seasoning","?? teaspoon salt","2 cloves garlic, minced","1 egg","?? cup grated Parmesan cheese","??? cup Italian seasoned bread crumbs"}	7.9	2	6.1	0.1
54	6	Chef John's Ricotta Meatballs	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1077229.jpg	{"?? onion, minced","2 tablespoons olive oil","3 cloves garlic, minced","1 pound ground beef","1 cup whole milk ricotta cheese","?? cup packed chopped Italian parsley","1 egg, beaten","1????? teaspoons kosher salt","?? teaspoon freshly ground black pepper","1 pinch cayenne pepper, or to taste","??? cup dry bread crumbs","2 tablespoons olive oil","1 (28 ounce) jar marinara sauce","1 cup water"}	16.3	18.9	20.9	9.4
55	53	Authentic Cincinnati Chili	Soups, Stews and Chili Recipes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2746439.jpg	{"2 pounds lean ground beef","1 quart water, or amount to cover","2 onions, finely chopped","1 (15 ounce) can tomato sauce","2 tablespoons vinegar","2 teaspoons Worcestershire sauce","4 cloves garlic, minced","?? (1 ounce) square unsweetened chocolate","?? cup chili powder","1????? teaspoons salt","1 teaspoon ground cumin","1 teaspoon ground cinnamon","?? teaspoon ground cayenne pepper","5 whole cloves","5 whole allspice berries","1 bay leaf"}	19.1	10.1	12.6	4
56	53	Instant Pot?? Crispy Chicken Carnitas	World Cuisine	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F6913262.jpg	{"1 tablespoon ground cumin","?? teaspoon chili powder","?? teaspoon dried oregano","1 pinch salt and ground black pepper to taste","3 tablespoons olive oil, divided","2 pounds skinless, boneless chicken breast halves","5 cloves garlic, pressed","1 yellow onion, quartered","?? cup lime juice","?? cup chicken broth","?? bunch cilantro","1 chipotle pepper in adobo sauce, or more to taste","1 orange, zested and juiced","1 bay leaf"}	19.6	4.7	15.3	1.6
57	53	Big Smokey Burgers	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F4045578.jpg	{"2 pounds ground beef sirloin","?? onion, grated","1 tablespoon grill seasoning","1 tablespoon liquid smoke flavoring","2 tablespoons Worcestershire sauce","2 tablespoons minced garlic","1 tablespoon adobo sauce from canned chipotle peppers","1 chipotle chile in adobo sauce, chopped"," salt and pepper to taste","6 (1 ounce) slices sharp Cheddar cheese (Optional)   6 hamburger buns"}	38.7	26.6	29.7	1.5
58	58	Unsloppy Joes	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F3379581.jpg	{"1 tablespoon olive oil","?? cup chopped onion","?? cup chopped celery","?? cup chopped carrots","?? cup chopped green bell pepper","1 clove garlic, minced","1 (14.5 ounce) can diced tomatoes","1????? tablespoons chili powder","1 tablespoon tomato paste","1 tablespoon distilled white vinegar","1 teaspoon ground black pepper","1 (15 ounce) can kidney beans, drained and rinsed","8 kaiser rolls"}	7.8	34.6	3.9	3.4
59	58	Hamburgers by Eddie	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F2247628.jpg	{"1 pound ground beef","1 egg","2 teaspoons minced garlic","1 tablespoon steak sauce (e.g. A-1), or to taste"}	20.6	1.1	31.4	0.1
60	60	Melinda's Porcupine Meatballs	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F3343759.jpg	{"1 pound ground beef","?? cup uncooked white rice","?? cup water","??? cup chopped onion","1 teaspoon salt","?? teaspoon celery salt","??? teaspoon garlic powder","??? teaspoon ground black pepper","1 (15 ounce) can tomato sauce","1 cup water, or more as needed","2 teaspoons Worcestershire sauce"}	22.2	26.1	13.7	5.1
61	58	Andie's Quick 'n Easy Sneaky Sloppy Joes	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F4398244.jpg	{"1 cup lentils","2 onions, diced","1 pound lean ground beef","1 large green bell pepper, diced","?? cup ketchup","?? cup barbeque sauce","1 tablespoon Worcestershire sauce","1 tablespoon minced garlic"}	18.2	35.6	7.4	14.8
62	60	Best Hamburger Ever	Main Dishes	https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5563136.jpg	{"1????? pounds lean ground beef","?? onion, finely chopped","?? cup shredded Colby Jack or Cheddar cheese","1 teaspoon soy sauce","1 teaspoon Worcestershire sauce","1 egg","1 (1 ounce) envelope dry onion soup mix","1 clove garlic, minced","1 tablespoon garlic powder","1 teaspoon dried parsley","1 teaspoon dried basil","1 teaspoon dried oregano","?? teaspoon crushed dried rosemary"," salt and pepper to taste"}	39	8.8	27.5	1.8
79	74	Sandwich	Appetizers and Snacks	https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190322-ham-sandwich-horizontal-1553721016.png	{" bread","  cheese","  onions"}	1.2	5	3.3333333	1
\.


--
-- TOC entry 3327 (class 0 OID 16595)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, email, password, rating) FROM stdin;
1	Paul Rice	paul.rice@gmail.com	5b7a8b80e81353a6c424b6b3b9596e73	0
2	Lillie Dobbins	lillie.dobbins@gmail.com	ed16e671d2fb8bcd49f6db2bb71fb1a4	0
3	Charles Sieving	charles.sieving@gmail.com	f296bd58fe79aca12ad466e1536dde9d	0
4	Emilio Morris	emilio.morris@gmail.com	bcab5339a3fb936e9da37ceb4e621b5c	0
5	Marlene Plymel	marlene.plymel@gmail.com	a4eebd93bffe73ea0d95b24627771657	0
7	Devon Stamey	devon.stamey@gmail.com	093c0619ac299a01b0700c6012f3858a	0
8	Debra Sanders	debra.sanders@gmail.com	da9d01666ddcc73e87ad64e0f428ca3e	0
9	Doreen Bell	doreen.bell@gmail.com	0e407dc7f77563d80cb4179ded0f5b22	0
10	Andrew Criswell	andrew.criswell@gmail.com	b8f22e91bb66a390c10f1d21bab17dc0	0
11	Adam Obermiller	adam.obermiller@gmail.com	26f706420068c8fbbaeadb26df2edf5b	0
12	Joseph Kiser	joseph.kiser@gmail.com	be8d6dde6f0d3e830a81e24106b213f8	0
13	Mack Bailey	mack.bailey@gmail.com	cbb146b7d027b813a018dc48e7d22646	0
14	Elizabeth Garlock	elizabeth.garlock@gmail.com	d3a0cdbcb810611220c5aedbaa4ad137	0
15	Derek Choudhury	derek.choudhury@gmail.com	c6ccd7d9c9a3ed60aefe69e129f3c5be	0
16	Tiffany Schmucker	tiffany.schmucker@gmail.com	81433096c03ef5ac2d86dfddf3a66c51	0
17	Virginia Holleran	virginia.holleran@gmail.com	9a59101d63bebc782a213c161ed8cfc6	0
18	Jessica Root	jessica.root@gmail.com	b14b64dde79847d42fa7c89008c0a6e8	0
19	Paul Mccormick	paul.mccormick@gmail.com	9b43ceff844188c0e4a9d414e01f0fba	0
20	Calvin Mohammad	calvin.mohammad@gmail.com	f4dad165fd6716db17c17cd4e37b30f6	0
21	Adolfo Russell	adolfo.russell@gmail.com	8f938a4b5f4f781f4d1a332bcc728ae6	0
22	Claire Erickson	claire.erickson@gmail.com	9769788671d1ee4d913a3ebfdcd82ffc	0
23	Damon Williams	damon.williams@gmail.com	c20d08b58e5e427e1135d514c844299a	0
24	James White	james.white@gmail.com	cfa54f63fa5cb8359d9972c5ddd99318	0
25	Patricia Bukovsky	patricia.bukovsky@gmail.com	277b56baf228e6d68d63ebff922a76d7	0
26	Earnest Allen	earnest.allen@gmail.com	f258bc76bb634b052571bc804f286be5	0
27	Lisa Woodruff	lisa.woodruff@gmail.com	24642aa53e431de35100f776a5d82a50	0
28	Margaret Brumit	margaret.brumit@gmail.com	abc446d90661a7b77b0d128610ad0fdd	0
29	Anthony Rancourt	anthony.rancourt@gmail.com	13eca688c913bc191f1438d9736b31d7	0
30	Maria Darwin	maria.darwin@gmail.com	29bbd382d6b1ec0816768823271e638c	0
31	Tracey Gomez	tracey.gomez@gmail.com	4633170d086ff2d7bbb0c75411b7bbf8	0
32	Jane Day	jane.day@gmail.com	6a482fe382bf4851195c3ade633cd13d	0
33	David Ferreira	david.ferreira@gmail.com	092f8b76cb00981582bbc1176f29be23	0
34	Tina Mclennan	tina.mclennan@gmail.com	b753224468498989eed496d3c251daa9	0
35	John Flores	john.flores@gmail.com	e7344ce21dfbd85eeb0bdbb24ccb83e4	0
36	Naomi Swift	naomi.swift@gmail.com	dd3b1c10845200d3b94072cddce651b9	0
37	Mary Severy	mary.severy@gmail.com	c655b7ed424082a3a6566ab39d74586f	0
38	David Breckenridge	david.breckenridge@gmail.com	b7cd96995d2cd8c6639753dfc4a9d642	0
39	Roger Fulcher	roger.fulcher@gmail.com	62cc52fb6a2906649f47238717e78906	0
40	Lyle Bredesen	lyle.bredesen@gmail.com	34a1588ca990a6c3f5b8361cc7344bfc	0
41	Shirley Delgado	shirley.delgado@gmail.com	5a7c4d1e33c4d16a3ed32d638f304e7a	0
42	Winford Watts	winford.watts@gmail.com	8d7e2f314f20e16e5a1a58343d35bc43	0
43	Reyes Gonzales	reyes.gonzales@gmail.com	2c3123a211511faa313ced7fa58c5d96	0
44	Israel Craig	israel.craig@gmail.com	05ad302b7b23e8c8430292726229d9dd	0
45	Sheri Mears	sheri.mears@gmail.com	6e02a706885ecc1a01754a01f571d1e8	0
46	Alejandro Rogers	alejandro.rogers@gmail.com	25a3240775a405185d1484a77ee32d2e	0
47	Sydney Bolton	sydney.bolton@gmail.com	1c3a8bfb8ff39b924185b314991a3b05	0
48	Heidi Cadwallader	heidi.cadwallader@gmail.com	1c29b29e14e3f381a26a2e08c238255f	0
49	Linda Hood	linda.hood@gmail.com	e609bc431c69f62baea99fd1aa88486f	0
50	Stuart Klein	stuart.klein@gmail.com	71df6c178ea1b7144407c5cf375b83e6	0
51	Kenneth Potter	kenneth.potter@gmail.com	bf1d1340fc05c518af0510195e96300d	0
52	Joseph Boyer	joseph.boyer@gmail.com	170f5f3db05ba3ff3398df35bc8f714b	0
53	Amy Bates	amy.bates@gmail.com	af653ee348d2acff354420d609829bfe	0
54	Janice Pulido	janice.pulido@gmail.com	f8e2fe94e671e663fc2e14f7cc8bfec5	0
55	John Bowling	john.bowling@gmail.com	1b8d0a673ea62c1cc8003cd3f2084254	0
56	Monica Ellis	monica.ellis@gmail.com	2b6ef359675a31af9820b0f5d1ae8599	0
57	Doreen London	doreen.london@gmail.com	44866ba61f7946f7928fb2477cc2b482	0
59	Michael Thomas	michael.thomas@gmail.com	62c43f2bc1c6d6b604f9d4cb5e6c6c1f	0
60	Juan Bilodeau	juan.bilodeau@gmail.com	540cd3bfe9847bdeb3312b73e1fe7d23	0
61	Alexander Scott	alexander.scott@gmail.com	ee1ccd0cc6ab46fff05ad891dedfc2a0	0
73	Manny Chavez	jmchav17@asu.edu	c4ca4238a0b923820dcc509a6f75849b	0
74	Juan Chavez Garcia	manny.chavez12@yahoo.com	c4ca4238a0b923820dcc509a6f75849b	3
76	Bryce Tran	bryce.tran@gmail.com	e10adc3949ba59abbe56e057f20f883e	0
6	John Holley	john.holley@gmail.com	4e73d2b5419c2fb7ce4f4c50b5eb9e54	1
58	Sara Wyss	sara.wyss@gmail.com	30e60b46d02c0971871f89acf24ad952	1
\.


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 211
-- Name: recipes_recipeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_recipeid_seq', 79, true);


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 76, true);


--
-- TOC entry 3183 (class 2606 OID 16624)
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (userid, recipeid);


--
-- TOC entry 3181 (class 2606 OID 16614)
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipeid);


--
-- TOC entry 3177 (class 2606 OID 16605)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3179 (class 2606 OID 16603)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3186 (class 2606 OID 16630)
-- Name: bookmarks bookmarks_recipeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_recipeid_fkey FOREIGN KEY (recipeid) REFERENCES public.recipes(recipeid) ON DELETE CASCADE;


--
-- TOC entry 3185 (class 2606 OID 16625)
-- Name: bookmarks bookmarks_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;


--
-- TOC entry 3184 (class 2606 OID 16615)
-- Name: recipes recipes_chefid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_chefid_fkey FOREIGN KEY (chefid) REFERENCES public.users(userid) ON DELETE CASCADE;


-- Completed on 2021-12-02 10:11:37

--
-- PostgreSQL database dump complete
--

