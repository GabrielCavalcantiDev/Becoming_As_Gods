var i = 0
function ativarFuncao(){
  var imgLi = document.querySelectorAll(".img-js")

  for(var iImg = 0; iImg < imgLi.length; iImg++){
    imgLi[iImg].classList.remove('ativo')
  }
  
  imgLi[i].classList.toggle('ativo')
  i++

  if(i >= imgLi.length){
    i = 0
  }
}
ativarFuncao()
setInterval(ativarFuncao, 5000)