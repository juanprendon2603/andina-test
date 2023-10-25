import { Component, OnInit } from '@angular/core';
import { GithubService } from '../github.service';

@Component({
  selector: 'app-popular-repos',
  templateUrl: './popular-repos.component.html',
  styleUrls: ['./popular-repos.component.css']
})
export class PopularReposComponent implements OnInit {
  repositories: any[] = [];

  constructor(private githubService: GithubService) { }

  ngOnInit() {
    this.githubService.getTopRepositories().subscribe((data: any) => {
      this.repositories = data.items;
    });
  }
}

