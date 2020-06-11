const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    add,
    update,
    remove,
    findSteps
}

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({ id }).first();
}

function add(scheme) {
    return db('schemes')
        .insert(scheme, 'id')
        .then(ids => ({ id: ids[0] }));
}


function findSteps(id) {
    return db('steps')
        .join('schemes', 'schemes.id', 'steps.scheme_id')
        .where('steps.scheme_id', id)
        .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .orderBy('steps.step_number')
}


function update(changes, id) {
    return db('schemes')
        .where('id', Number(id))
        .update(changes);
}


function remove(id) {
    return db('schemes')
        .where('id', Number(id))
        .del();
}