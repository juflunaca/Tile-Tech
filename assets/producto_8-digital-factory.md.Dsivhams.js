import{_ as t,c as i,o,a1 as r,j as e,a}from"./chunks/framework.C7DjcIZG.js";const l="/Tile-Tech/assets/basic-physics.NxfASBWZ.png",s="/Tile-Tech/assets/sensors-actuators.BpBfukId.png",n="/Tile-Tech/assets/OPC-signals.CK-Vu3UW.png",c="/Tile-Tech/assets/layout-fabrica.B49NsswM.png",B=JSON.parse('{"title":"Digital Factory","description":"","frontmatter":{},"headers":[],"relativePath":"producto/8-digital-factory.md","filePath":"producto/8-digital-factory.md"}'),d={name:"producto/8-digital-factory.md"},p=r('<h1 id="digital-factory" tabindex="-1">Digital Factory <a class="header-anchor" href="#digital-factory" aria-label="Permalink to &quot;Digital Factory&quot;">​</a></h1><p>Se presenta el desarrollo de la simulación de una fábrica digital desarrollado en NX.</p><h2 id="gemelo-digital" tabindex="-1">Gemelo digital <a class="header-anchor" href="#gemelo-digital" aria-label="Permalink to &quot;Gemelo digital&quot;">​</a></h2><p>Se realizó el gemelo digital de una máquina de empacado de baldosas, en el cual se simula el proceso y se maneja la actuación a través de comunicación OPC mediante ignition conectando NX con un controlador PLC simulado. La lógica es desarrollada usando lenguaje ladder para determinar las subrutinas, las cuales fueron desarrolladas en GRAFCET. Este tipo de programación facilita el desarrollo de rutina complejas mediante la representación gráfica de las mismas.</p><p><img src="'+l+'" alt=" gemelo digital"></p><p><img src="'+s+'" alt=" gemelo digital" width="60%"></p><p><img src="'+n+'" alt=" gemelo digital" width="60%"></p>',7),m=e("iframe",{width:"560",height:"315",src:"https://www.youtube.com/embed/OOryg0T-8Ps?si=zwQEkovh5ce04zeW",title:"YouTube video player",frameborder:"0",allow:"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share",referrerpolicy:"strict-origin-when-cross-origin",allowfullscreen:""},null,-1),u=e("p",null,"A continuación se presenta la demostración del funcionamiento de las etapas desarrolladas en NX.",-1),g=e("iframe",{width:"560",height:"315",src:"https://www.youtube.com/embed/Azf9Fd5UB84?si=1J0MO_XdI1FadSqF",title:"YouTube video player",frameborder:"0",allow:"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share",referrerpolicy:"strict-origin-when-cross-origin",allowfullscreen:""},null,-1),_=e("p",null,[a("Cada estación de trabajo fue desarrollada en NX, en un archivo independiente, a fin de tener modularidad e independencia entre las mismas. Gracias a lo anterior el control y la puesta en marcha puede desarrollarse por etapas, sin tener que enfrentar la complejidad y el peso computacional de todas las escenas en simultáneo. Se realiza la integración de las rutinas de cada estación en el archivo "),e("code",null,"ceramic_plant.prt"),a(" obteniendo la planta completa como se observa en la imagen.")],-1),h=e("p",null,[e("img",{src:c,alt:"gemelo digital",width:"60%"})],-1),f=[p,m,u,g,_,h];function y(b,w,T,N,P,S){return o(),i("div",null,f)}const C=t(d,[["render",y]]);export{B as __pageData,C as default};
