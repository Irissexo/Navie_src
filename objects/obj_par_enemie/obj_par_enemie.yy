{
  "$GMObject":"",
  "%Name":"obj_par_enemie",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_par_enemie",
  "overriddenProperties":[],
  "parent":{
    "name":"enemies",
    "path":"folders/Objetos/enemies.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"HP_max","filters":[],"listItems":[],"multiselect":false,"name":"HP_max","rangeEnabled":true,"rangeMax":10.0,"rangeMin":1.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"3","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"target","filters":[],"listItems":[],"multiselect":false,"name":"target","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"obj_player","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"hurt_max","filters":[],"listItems":[],"multiselect":false,"name":"hurt_max","rangeEnabled":true,"rangeMax":60.0,"rangeMin":1.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"5","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"pts_value","filters":[],"listItems":[],"multiselect":false,"name":"pts_value","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"20","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_enemie_base",
    "path":"sprites/spr_enemie_base/spr_enemie_base.yy",
  },
  "spriteMaskId":null,
  "tags":[
    "col",
  ],
  "visible":true,
}