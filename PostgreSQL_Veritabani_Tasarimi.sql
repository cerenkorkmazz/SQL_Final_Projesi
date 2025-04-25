--PostgreSQL ile Çevrimiçi Eğitim Platformu Veritabanı Tasarımı Projesi

CREATE TABLE Members (
        member_id SERIAL PRIMARY KEY,
        username VARCHAR(50) UNIQUE NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL
);
CREATE TABLE Courses (
        course_id SERIAL PRIMARY KEY,
        title VARCHAR(200) NOT NULL,
        description TEXT,
        start_date DATE,
        end_date DATE,
        instructor VARCHAR(100)
);
CREATE TABLE Categories (
        category_id SMALLINT PRIMARY KEY,
        name VARCHAR(100) NOT NULL
);
CREATE TABLE CourseCategories (
        course_id INTEGER NOT NULL,
        category_id SMALLINT NOT NULL,
        PRIMARY KEY (course_id, category_id),
        FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE,
        FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);
CREATE TABLE Enrollments (
        enrollment_id SERIAL PRIMARY KEY,
        member_id INTEGER NOT NULL,
        course_id INTEGER NOT NULL,
        enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
       FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
CREATE TABLE Certificates (
        certificate_id SERIAL PRIMARY KEY,
        certificate_code VARCHAR(100) UNIQUE NOT NULL,
        issue_date DATE NOT NULL
);
CREATE TABLE CertificateAssignments (
        assignment_id SERIAL PRIMARY KEY,
        member_id INTEGER NOT NULL,
       certificate_id INTEGER NOT NULL,
       received_date DATE,
       FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
       FOREIGN KEY (certificate_id) REFERENCES Certificates(certificate_id) ON DELETE CASCADE
);
CREATE TABLE BlogPosts (
        post_id SERIAL PRIMARY KEY,
        title VARCHAR(255) NOT NULL,   
        content TEXT NOT NULL,
        publish_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        author_id INTEGER,
        FOREIGN KEY (author_id) REFERENCES Members(member_id) ON DELETE SET NULL
);
