@extends('layouts.main')
@section('container')
    <h1 class="text-center my-2 py-2">Categories</h1>
    <div class="container">
        <div class="row justify-content-center">
            @foreach ($categories as $category)
                <div class="col-sm-4 my-4">
                    <a href="/posts?category={{ $category->slug }}">
                        <div class="card bg-dark text-white">
                            <img src="https://source.unsplash.com/300x200?{{ $category->name }}" class="card-img"
                                alt="...">
                            <div class="card-img-overlay d-flex align-items-center p-0">
                                <h5 class="card-title text-center flex-fill p-4 fs-3"
                                    style="background-color: rgba(0,0,0,0.6)"> {{ $category->name }}</h5>
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
@endsection
