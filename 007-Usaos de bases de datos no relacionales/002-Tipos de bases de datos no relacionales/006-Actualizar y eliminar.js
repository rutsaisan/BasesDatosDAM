// Actualizacion de un elemento
db.facturas.updateOne(
    {nombre:'Ruth'},
    {
        $set:
        {email:"prueba@prueba.com"}
    }
)

// Actualizar muchos
db.facturas.updateMany(
    {email:'info@juan.com'},
    {
        $set:
        {telefono:"11111111"}
    }
)

// Eliminar uno
db.facturas.deleteOne(
    {nombre:'Ruth'}
)