(()=>{
	let list = document.querySelector('.navi');
	let check = 'no';
	
	
	let nationExtendView = ()=>{
		let nation = ['한국','일본','미국','영국','프랑스','중국','러시아','독일','스페인'];
		createElement(nation);
	}
	
	let genreExtendView = ()=>{
		let genre = ['드라마','액션','스릴러','가족','SF','판타지'];
		createElement(genre);
	}
	
	let createElement = (nation)=>{
		let div = document.createElement('div');
		
		div.className = 'navi-extend-wrapper';
		let ul = document.createElement('ul');
		
		for(let i = 0; i < nation.length; i++){
			let a = document.createElement('a');
			a.className = "navi-extend-list";
			a.innerHTML = nation[i];
			a.href = "/movie/nationview.do";
			a.name = nation[i];
			ul.appendChild(a);
			
			console.dir(a.name);
		}
		
		div.append(ul);
		div.style.transitionDuration = '1s';
		list.appendChild(div);
		
		
	}
	


	let delView = () =>{
		document.querySelector('.navi-extend-wrapper').outerHTML = '';
	}
	
	document.querySelector('.nation-view').addEventListener('click',()=>{
		
		if(check == 'no'){
			nationExtendView();
			check = 'yes';
		} else {
			delView();
			check = 'no';
		}

	});
	
	document.querySelector('.year-view').addEventListener('click',()=>{
		if(check == 'no'){
			genreExtendView();
			check = 'yes';
		} else {
			delView();
			check = 'no';
		}
	});
	
})();