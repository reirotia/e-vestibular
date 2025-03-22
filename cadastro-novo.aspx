<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastro-novo.aspx.cs" Inherits="cadastro" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    
     <div class="pcoded-content">
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="card">

											<div class="card-header">
												<h5>Cadastro de Usuário</h5>
												<!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
											</div>
											<div class="card-block">
												<form class="form-material" id="cadastro" name="cadastro" method="post">
													    	<div class="form-group form-default">
														<input type="text" name="nome" id="nome"
															class="form-control" required="" maxlength="80"> <span
															class="form-bar"></span> <label class="float-label">Nome:</label>
													</div>
													<div class="form-group form-default">
														<input type="text" name="cpf" id="cpf"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">CPF:</label>
													</div>
                                                   	<div class="form-group form-default">
														<input type="text" name="rg" id="rg"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">RG:</label>
													</div>
													<div class="form-group form-default">
														<input type="text" name="email" id="email"
															class="form-control" required=""> <span
															class="form-bar"></span> <label class="float-label">Email
															(exa@gmail.com)</label>
													</div>

                                                    <div class="form-group form-default">
														<input type="text" name="celular" id="celular"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">Celular:</label>
													</div>

                                                        <div class="form-group form-default">
														<input type="text" name="instagram" id="instagram"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">instagram:</label>
													</div>

                                                      <div class="form-group form-default">
														<input type="text" name="faculdade" id="faculdade"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">Faculdade é numero:</label>
													</div>

                                                    <div class="form-group form-default">
														<input type="text" name="campos" id="campos"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">Campos é numero:</label>
													</div>

                                                      <div class="form-group form-default">
														<input type="text" name="curso" id="curso"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">Cuso é numero:</label>
													</div>

                                                      <div class="form-group form-default">
														<input type="text" name="formaIngresso" id="formaIngresso"
															class="form-control" required="" maxlength="11"> <span
															class="form-bar"></span> <label class="float-label">Forma Ingresso é numero:</label>
													</div>


													<button class="btn btn-primary waves-effect waves-light" id="salvar" onclick="enviaForm();">Primary
														Button</button>
													<button class="btn btn-success waves-effect waves-light">Success
														Button</button>

													<button class="btn btn-info waves-effect waves-light" id="voltar" onclick="voltarForm();">Salvar</button>
													<button class="btn btn-warning waves-effect waves-light">Warning
														Voltar</button>
													

												</form>

                                               <script>
                                                   function enviaForm() {
                                                    
                                                       var form = document.getElementById('cadastro');
                                                       form.action = "default3.aspx";
                                                       form.submit();
                                                      
                                                   }
                                                   function voltarForm() {
                                                    
                                                       var form = document.getElementById('cadastro');
                                                       form.action = "index.aspx";
                                                       form.submit();
                                                      
                                                   }
                                                </script>

											</div>
										</div>
										<!-- Page-body end -->
									</div>
									<div id="styleSelector"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
  </body>
</html>