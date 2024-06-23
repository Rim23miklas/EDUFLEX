-- create the database

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('STUDENT', 'PROFESSOR') NOT NULL
);


-- han nzido des users

-- Inserting professors
INSERT INTO users (nom, prenom, email, password, role)
VALUES 
    ('RIANE', 'Fouad', 'fouad.riane@example.com', '12121212', 'PROFESSOR'),
    ('BENSIALI', 'Bouchra', 'bouchra.bensiali@example.com', '12121212', 'PROFESSOR'),
    ('BENSIALI', 'Bouchra', 'bouchra.bensiali1@example.com', '12121212', 'PROFESSOR'),
    ('LLORED', 'Jean Pierre', 'jeanpierre.llored@example.com', '12121212', 'PROFESSOR'),
    ('AHIDAR', 'Adil', 'adil.ahidar@example.com', '12121212', 'PROFESSOR'),
    ('BELHBOUB', 'Anouar', 'anouar.belhboub@example.com', '12121212', 'PROFESSOR'),
    ('AHIDAR', 'Adil', 'adil.ahidar1@example.com', '12121212', 'PROFESSOR'),
    ('AHIDAR', 'Adil', 'adil.ahidar2@example.com', '12121212', 'PROFESSOR'),
    ('AHIDAR', 'Adil', 'adil.ahidar3@example.com', '12121212', 'PROFESSOR');

-- Inserting students
INSERT INTO users (nom, prenom, email, password, role)
VALUES 
    ('Ouazzani chahdi', 'Nada', 'nada.ouazzani@example.com', '12121212', 'STUDENT'),
    ('Miklass', 'Rim', 'rim.miklass@example.com', '12121212', 'STUDENT'),
    ('Sorho', 'zana lacina', 'lacina.sorho@example.com', '12121212', 'STUDENT'),
    ('Ouzahra', 'Hamza', 'hamza.ouzahra@example.com', '12121212', 'STUDENT'),
    ('Soro', 'Seriba Franck Herve', 'herve.soro@example.com', '12121212', 'STUDENT');



-- create tables

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    id_sender INT NOT NULL,
    id_receiver INT NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sender) REFERENCES users(id),
    FOREIGN KEY (id_receiver) REFERENCES users(id)
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    professor_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    thumbnail VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (professor_id) REFERENCES users(id)
);

INSERT INTO courses (professor_id, title, description, thumbnail)
VALUES
    (1, 'Gestion d''entreprise', 'Cours sur la gestion d''entreprise', 'https://cashtrack.io/wp-content/uploads/2021/05/cashtrack-gestion-dentreprise-5-principes-pour-entrepreneur.jpg'),
    (2, 'Analyse', 'Cours d''analyse mathématique', 'https://img.freepik.com/vecteurs-premium/formule-mathematique-calcul-mathematiques-tableau-noir-ecole-concept-education-vecteur-modele-craie-science-algebre-geometrie-analyse-scientifique-calcul-nombres-connaissances-complexes_102902-3216.jpg'),
    (3, 'MMC', 'Cours de mathématiques pour la matière continue', 'https://www.researchgate.net/profile/Deghboudj-Samir/publication/311909114/figure/fig3/AS:667868085620740@1536243568381/Coupure-sur-une-facette-Isolant-virtuellement-la-partie-2-et-faisant-apparaitre-les_Q320.jpg'),
    (4, 'Philosophie de sciences', 'Cours sur la philosophie des sciences', 'https://www.shutterstock.com/image-vector/philosophy-concept-art-handdrawn-philosophers-260nw-2388837811.jpg'),
    (5, 'Probabilité', 'Cours sur la probabilité et la théorie des jeux', 'https://misterprepa.net/wp-content/uploads/2021/01/Annale-de-Maths-Probabilite%CC%81s-2e%CC%80me-anne%CC%81e-03.png'),
    (6, 'La quantique', 'Cours sur la physique quantique', 'https://etudestech.com/wp-content/uploads/2023/08/adobestock_613328978-1536x960.jpeg'),
    (7, 'Regression linéaire', 'Cours sur la régression linéaire et les modèles statistiques', 'https://bookdown.org/AODiakite/r4econometrics/03-simple-lm_files/figure-html/lm1-1.png'),
    (8, 'La statistique', 'Cours sur les méthodes statistiques avancées', 'https://i0.wp.com/statisticsbyjim.com/wp-content/uploads/2022/01/t_test_statistic_critical_values.png?resize=576%2C384&ssl=1'),
    (9, 'Transfert de chaleur', 'Cours sur le transfert de chaleur et les processus thermodynamiques', 'https://jeretiens.net/wp-content/uploads/2016/05/mode_transfert_thermique_conduction_convection_rayonnement.jpg');



CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

