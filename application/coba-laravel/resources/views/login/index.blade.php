@extends('layouts.main')
@section('container')
<div class="row justify-content-center mt-5">
  <div class="col-lg-5">
    @if(session()->has('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
      {{ session('success') }}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    @endif 
    <main class="form-signin">
      <h1 class="h3 mb-3 fw-normal text-center">Please login</h1>
      <form action="/login" method="POST">
        @csrf
        <div class="form-floating">
          <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" placeholder="name@example.com" autofocus required value="{{ old('email') }}">
          <label for="email">Email address</label>
          @error('email')
            <div class="invalid-feedback">
              {{ $message }}
           </div>
          @enderror
        </div>
        <div class="form-floating">
          <input type="password" class="form-control " id="password" name="password" placeholder="Password" required>
          <label for="password">Password</label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
      </form>
      <small class="d-block text-center mt-3">Aren't have an account? <a href="/register">Create an account!</a></small>
    </main>
  </div>
</div>
@endsection