@extends('dashboard.layouts.main')
@section('container')
<div class="container">
    <div class="row my-3">
      <div class="col-lg-8">
          <h2>{{ $post->title}}</h2>
         <a href="/dashboard/posts" class="btn btn-primary mt-1"><span data-feather="chevron-left"></span>  back to my post</a>
         <a href="" class="btn btn-success mt-1"><span data-feather="edit"></span>Edit</a>
         <a href="" class="btn btn-danger mt-1"><span data-feather="delete"></span>  Delete</a>
          <img src="https://source.unsplash.com/1200x400?{{ $post->category->name }}" class="img-fluid mt-3">
          <article class="my-3 fs-6">
          {!! $post->body !!}
          </article>
        <a href="/posts">Back to Posts</a>
      </div>
    </div>
  </div>
@endsection