# Prueba final G46 Desafío Latam

Entrega hito 2 prueba Desafío Latam

### **Trello board**
[Trello](https://trello.com/b/894j20uO/apa%C3%B1ameorg)
### **Acerca de este proyecto**
Apañame.org es una plataforma que pretende conectar a personas con proyectos de emprendimiento con otras personas que quieran aportar a ellos mediante financiamiento colectivo. Un usuario puede publicar una causa que busca financiar su negocio o parte de éste, mientras que otros usuarios pueden aportar a su proyecto donando puntos que pueden adquirirse en la plataforma. Los usuarios pueden interactuar entre ellos comentando cada proyecto de empredimiento, además de obtener recompensas en la medida que a  poyen una causa (iconos por categoría y recompensas otorgadas por los emprendedores).

### **Modelo físico**
![Modelo físico](https://trello.com/1/cards/61a1e506085b4d296d1e51f7/attachments/61ae95c3b912ae528163bc14/previews/61ae95c4b912ae528163bc25/download/apa%C3%B1ame.cl.jpg)

#### *Versiones*
- Version 3.0 
  - Se habilita autenticación con devise
  - Se habilita panel de administrador
  - Se habilita publicación de causas y relación entre usuario-emprendimiento-causa
  - Se habilita agregar comentarios en las causas por parte de los usuarios
  - Se habilita inicio de sesión con facebook
  - Se habilitan donaciones mediante MACH (en sandbox, sin funcionalidad del webhook)
  - Se habilitan charts en el menú en la vista show de user
### **Instalación**
  1. `git clone https://github.com/r-osoriobarra/finalG46`
  2. `rails db:migrate`
  3. `rails db:seed`
  4.  Para acceder como perfil de administrador  

```
user: admin@mail.com
pass: 123123
```

  5. Para acceder como un perfil de usuario
    
```
user: userAA@mail.com, donde AA, es número entre 0 y 19
pass: 123123
```
### *Herramientas*
    *ruby v2.7.3
    *rails v5.2.6
    *Devise gem
    *Faker gem
    *RailsAdmin gem
    *CanCanCan gem
    *Omniauth gem
    *rqrcode gem
    *chartkick gem
