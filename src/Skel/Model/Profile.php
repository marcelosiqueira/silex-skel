<?php
namespace Skel\Model;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use JMS\Serializer\Annotation\Type;

/**
 * @ORM\Entity
 * @ORM\Table(name="profiles")
 */
class Profile extends Entity
{
    /**
     * @ORM\Column(type="string", length=150)
     * @Type("string")
     * @var string
     */
    private $title;

    /**
     * @ORM\OneToMany(targetEntity="User", mappedBy="profile", cascade={"all"}, orphanRemoval=true, fetch="LAZY")
     * @ORM\OrderBy({"name" = "ASC"})
     *
     * @var Doctrine\Common\Collections\Collection
     */
    protected $userCollection;

    public function __construct()
    {
        parent::__construct();
        $this->userCollection = new ArrayCollection;
    }

    public function getTitle()
    {
        return $this->title;
    }

    public function setTitle($name)
    {
        return $this->title = filter_var($title, FILTER_SANITIZE_STRING);
    }

    public function getUserCollection()
    {
        return $this->userCollection;
    }
    public function setUserCollection($userCollection)
    {
        return $this->userCollection = $userCollection;
    }
}
