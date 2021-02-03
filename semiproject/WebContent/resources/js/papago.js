
	let translation = () =>{
		/*명대사값만 가져오기 text에*/
	let text = fms.value;
	let transDiv = document.querySelector('.trans');
	let url ="/papago/translation.do";
	let headerObj = new Headers();
	headerObj.append('Content-Type',"application/x-www-form-urlencoded");
	if(text){
		fetch(url,{
			method:"post",
			headers : headerObj,
			body : "text="+text
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
			throw new AsyncPageError(response.text());
		})
		.then((msg)=>{
			
			if(msg == 'fail'){
				transDiv.innerHTML = '번역할 수 없습니다.';
			} else {
				transDiv.innerHTML = msg;
			}
		}).catch(error=>{
			error.alertMessage();
		})
	} else { 
		alert("입력하지 않았습니다.");
	}
}
