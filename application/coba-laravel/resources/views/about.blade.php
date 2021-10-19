@extends('layouts.main')
@section('container')
<h1 class="display-title my-3 "> Halaman About </h1>
<div class="card mt-4 border-success" style="max-width: 38rem;">
  <div class="card-header border-success">
    <h5 class="card-title fs-2 text-center">About Me</h5>
  </div>
  <div class="row g-0">
    <div class="col-sm-4">
      <img src="img/{{ $image }}" class="rounded-circle px-2 py-2">
    </div>
    <div class="col-sm-8">
      <div class="card-body px-4 my-2">
        <p class="card-text fs-3 fw-bold">{{ $name }}</p>
        <hr class="text-success">
        <p class="card-text fst-italic text-primary">{{ $profesi[0] }} -  {{ $profesi[1] }}</p>
        <p class="card-text"><small class="text-muted">{{ $email }}</small></p>
      </div>
    </div>
  </div>
</div>
  @endsection