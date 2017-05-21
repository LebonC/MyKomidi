<?php
	function spectacles() {
		$spectacles = getSpectacles();
		require '../vue/VueSpectacles.html';
	}