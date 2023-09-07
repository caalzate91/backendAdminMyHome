package com.adminmyhome.backend.controller

import com.adminmyhome.backend.entities.User
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.client.RestTemplate


@RestController
@RequestMapping("users")
class UserController {

    private val get_user_by_id = "https://firestore.googleapis.com/v1beta1/"
    private val param_url = "projects/totemic-union-396517/databases/(default)/documents/users/"
    private val queryString =
        "{\"structuredQuery\":{\"select\":{\"fields\":[{\"fieldPath\":\"name\"}]},\"from\":[{\"collectionId\":\"users\"}]}}"
    private val runQuery = "projects/totemic-union-396517/databases/(default)/documents:runQuery"
    var restTemplate = RestTemplate()

    @GetMapping("/search", produces = arrayOf("application/json"))
    fun searchForm(): User {
        return User("camilo.alzate@sofka.com.co","Camilo Alzate")
    }


}