<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->

	<script nonce="51733e18-25fc-4635-9e00-babae35f8483">(function (w, d) { !function (a, b, c, d) { a[c] = a[c] || {}; a[c].executed = []; a.zaraz = { deferred: [], listeners: [] }; a.zaraz.q = []; a.zaraz._f = function (e) { return function () { var f = Array.prototype.slice.call(arguments); a.zaraz.q.push({ m: e, a: f }) } }; for (const g of ["track", "set", "debug"]) a.zaraz[g] = a.zaraz._f(g); a.zaraz.init = () => { var h = b.getElementsByTagName(d)[0], i = b.createElement(d), j = b.getElementsByTagName("title")[0]; j && (a[c].t = b.getElementsByTagName("title")[0].text); a[c].x = Math.random(); a[c].w = a.screen.width; a[c].h = a.screen.height; a[c].j = a.innerHeight; a[c].e = a.innerWidth; a[c].l = a.location.href; a[c].r = b.referrer; a[c].k = a.screen.colorDepth; a[c].n = b.characterSet; a[c].o = (new Date).getTimezoneOffset(); if (a.dataLayer) for (const n of Object.entries(Object.entries(dataLayer).reduce(((o, p) => ({ ...o[1], ...p[1] })), {}))) zaraz.set(n[0], n[1], { scope: "page" }); a[c].q = []; for (; a.zaraz.q.length;) { const q = a.zaraz.q.shift(); a[c].q.push(q) } i.defer = !0; for (const r of [localStorage, sessionStorage]) Object.keys(r || {}).filter((t => t.startsWith("_zaraz_"))).forEach((s => { try { a[c]["z_" + s.slice(7)] = JSON.parse(r.getItem(s)) } catch { a[c]["z_" + s.slice(7)] = r.getItem(s) } })); i.referrerPolicy = "origin"; i.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(a[c]))); h.parentNode.insertBefore(i, h) };["complete", "interactive"].includes(b.readyState) ? zaraz.init() : a.addEventListener("DOMContentLoaded", zaraz.init) }(w, d, "zarazData", "script"); })(window, document);</script>
</head>

				<body class="hold-transition login-page">
					<div class="login-box">

						<div class="card card-outline card-primary">
							<div class="card-header text-center">
								<b>Acadmi</b>
							</div>
							<div class="card-body">
								<p class="login-box-msg">로그인하여 Acadmi에 접속하세요!</p>
								<form id="contactForm" action="./login" method="post" data-sb-form-api-token="API_TOKEN">
            						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<div class="input-group mb-3">
										<input class="form-control" id="username" value="${cookie.remember.value}" name="username"  placeholder="아이디를 입력하세요"/>
										<div class="input-group-append">
											<div class="input-group-text">
												<span class="fas fa-user"></span>
											</div>
										</div>
									</div>
									<div class="input-group mb-3">
										<input class="form-control" id="password" name="password" type="password" placeholder="비밀번호를 입력하세요"/>
										<div class="input-group-append">
											<div class="input-group-text">
												<span class="fas fa-lock"></span>
											</div>
										</div>
									</div>
									<div class="row">

										<div class="col-4">
											<button class="btn btn-info btn-block float-right" id="submitButton" type="submit">로그인</button>
										</div>

									</div>
								</form>

								<p class="mb-1">
									<a href="./findPw">비밀번호 찾기</a>
								</p>
							</div>
						</div>

					</div>