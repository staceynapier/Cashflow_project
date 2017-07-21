DROP TABLE transactions;
DROP TABLE tags;

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255),
  icon VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  merchant VARCHAR(255),
  value INT4,
  date_of_trans DATE,
  tag_id INT4 REFERENCES tags(id)
);
