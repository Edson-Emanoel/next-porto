/*
  Warnings:

  - Made the column `nome` on table `operador` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_operador" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "ativo" TEXT
);
INSERT INTO "new_operador" ("ativo", "id", "nome") SELECT "ativo", "id", "nome" FROM "operador";
DROP TABLE "operador";
ALTER TABLE "new_operador" RENAME TO "operador";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
