
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT,
    endereco TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Restaurante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    categoria TEXT NOT NULL,
    telefone TEXT,
    endereco TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Pedido (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    restaurante_id INTEGER NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor REAL NOT NULL CHECK(valor >= 0),
    status TEXT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_pedido_cliente_id ON Pedido(cliente_id);
CREATE INDEX IF NOT EXISTS idx_pedido_restaurante_id ON Pedido(restaurante_id);
