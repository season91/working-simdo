(()=>{
	let list = document.querySelector('.navi');
	let check = 'no';
	
	
	let nationExtendView = ()=>{
		let nation = ['한국','일본','미국','홍콩','영국','프랑스','중국','러시아','독일','스페인'];
		createElement(nation);
	}
	
	let yearExtendView = ()=>{
		let year = ['1950년대','1960년대','1970년대','1980년대','1990년대','2000년대','2010년대','2020년대'];
		createElement(year);
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
			yearExtendView('연도별 조회 테스트');
			check = 'yes';
		} else {
			delView();
			check = 'no';
		}
	});
	
})();